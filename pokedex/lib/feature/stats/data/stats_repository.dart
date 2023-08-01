import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class StatsRepository {
  Future<PokemonSpecies> getPokemonSpecies(int id);
  Future<List<Type>> getTypes(List<String> urls);
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
  Future<List<Type>> getTypes(List<String> urls) async {
    final types = await Future.wait(urls.map((e) => _client.types.getByUrl(e)));
    return types;
  }
}
