import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class StatsRepository {
  Future<PokemonSpecies> getPokemonSpecies(int id);
}

@Injectable(as: StatsRepository)
class StatsRepositoryImpl implements StatsRepository {
  StatsRepositoryImpl(this._client);

  final Pokedex _client;

  @override
  Future<PokemonSpecies> getPokemonSpecies(int id) async {
    final species = await _client.pokemonSpecies.get(id: id);
    return species;
  }
}
