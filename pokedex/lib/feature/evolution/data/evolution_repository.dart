import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class EvolutionRepository {
  Future<EvolutionChain> getEvolutionChain(int id);
}

@Injectable(as: EvolutionRepository)
class EvolutionRepositoryImpl implements EvolutionRepository {
  EvolutionRepositoryImpl(this._client);

  final Pokedex _client;

  @override
  Future<EvolutionChain> getEvolutionChain(int id) async {
    final species = await _client.pokemonSpecies.get(id: id);

    final evolutionChain = await _client.evolutionChains
        .getByUrl(species.evolutionChain?.url ?? '');

    return evolutionChain;
  }
}
