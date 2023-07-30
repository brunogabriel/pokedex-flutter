import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/evolution/data/evolution_repository.dart';
import 'package:pokedex_flutter/feature/evolution/domain/entity/evolution_entity.dart';

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
    final chainLink = evolutionChain.chain;

    List<ChainLink> links = [chainLink];

    for (var element in chainLink.evolvesTo) {
      links.add(element);
      for (var element2 in element.evolvesTo) {
        links.add(element2);
      }
    }
    return EvolutionEntity(
      pokemon: pokemon,
      evolutions: links,
    );
  }
}
