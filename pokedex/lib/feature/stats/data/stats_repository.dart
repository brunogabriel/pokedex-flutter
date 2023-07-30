import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class StatsRepository {
  Future<PokemonSpecies> getPokemonSpecies(int id);
  Future<Type> getType(String url);
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

  @override
  Future<Type> getType(String url) async {
    final type = await _client.types.getByUrl(url);
    return type;
  }
}
