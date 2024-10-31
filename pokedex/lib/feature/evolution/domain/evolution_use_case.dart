import 'dart:collection';

import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

import '../../../shared/data/pair.dart';
import 'entity/evolution_entity.dart';
import 'mapper/evolution_mapper.dart';

abstract class EvolutionUseCase {
  Future<EvolutionEntity> getEvoluions(Pokemon pokemon);
}

@Injectable(as: EvolutionUseCase)
class EvolutionUseCaseImpl implements EvolutionUseCase {
  EvolutionUseCaseImpl(
    this._pokedex,
    this._evolutionMapper,
  );

  final Pokedex _pokedex;
  final EvolutionMapper _evolutionMapper;

  @override
  Future<EvolutionEntity> getEvoluions(Pokemon pokemon) async {
    final species = await _pokedex.pokemonSpecies.get(id: pokemon.id);
    final evolutionChain = await _pokedex.evolutionChains
        .getByUrl(species.evolutionChain?.url ?? '');
    return EvolutionEntity(
      pokemon: pokemon,
      evolutions: _calculateBreadthFirstSearch(evolutionChain.chain)
          .map((e) => _evolutionMapper.toEntity(e))
          .toList(),
    );
  }

  List<Pair<ChainLink, ChainLink>> _calculateBreadthFirstSearch(
      ChainLink node) {
    Queue<ChainLink> queue = Queue();
    Set<ChainLink> visited = {};
    List<Pair<ChainLink, ChainLink>> evolutions = [];
    queue.add(node);
    while (queue.isNotEmpty) {
      ChainLink current = queue.removeFirst();
      for (ChainLink neighbor in current.evolvesTo) {
        if (!visited.contains(neighbor)) {
          queue.add(neighbor);
          visited.add(neighbor);
          evolutions.add(Pair(current, neighbor));
        }
      }
    }
    return evolutions;
  }
}
