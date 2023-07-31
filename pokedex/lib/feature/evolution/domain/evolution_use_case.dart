import 'dart:collection';

import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/evolution/data/evolution_repository.dart';
import 'package:pokedex_flutter/feature/evolution/domain/entity/evolution_entity.dart';
import 'package:pokedex_flutter/feature/evolution/domain/mapper/evolution_mapper.dart';
import 'package:pokedex_flutter/shared/data/pair.dart';

abstract class EvolutionUseCase {
  Future<EvolutionEntity> getEvoluions(Pokemon pokemon);
}

@Injectable(as: EvolutionUseCase)
class EvolutionUseCaseImpl implements EvolutionUseCase {
  EvolutionUseCaseImpl(this._repository);

  final EvolutionRepository _repository;

  @override
  Future<EvolutionEntity> getEvoluions(Pokemon pokemon) async {
    final evolutionChain = await _repository.getEvolutionChain(pokemon.id);
    return EvolutionEntity(
      pokemon: pokemon,
      evolutions: _calculateBreadthFirstSearch(evolutionChain.chain)
          .map((e) => e.toEntity())
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
