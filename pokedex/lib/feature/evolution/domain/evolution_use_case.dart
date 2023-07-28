import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/evolution/data/evolution_repository.dart';

abstract class EvolutionUseCase {
  Future<List<ChainLink>> getChainLink(int id);
}

@Injectable(as: EvolutionUseCase)
class EvolutionUseCaseImpl implements EvolutionUseCase {
  EvolutionUseCaseImpl(this._repository);

  final EvolutionRepository _repository;

  @override
  Future<List<ChainLink>> getChainLink(int id) async {
    final evolutionChain = await _repository.getEvolutionChain(id);
    final chainLink = evolutionChain.chain;

    List<ChainLink> links = [chainLink];

    for (var element in chainLink.evolvesTo) {
      links.add(element);
      for (var element2 in element.evolvesTo) {
        links.add(element2);
      }
    }
    return links;
  }
}
