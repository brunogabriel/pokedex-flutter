import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons(int limit, int offset);
}

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._client);

  final Pokedex _client;

  @override
  Future<List<Pokemon>> getPokemons(int limit, int offset) async {
    final resource = await _client.pokemon.getPage(limit: 100, offset: offset);

    final pokemons = await Future.wait(resource.results
        .map((resource) => resource.url)
        .map((url) => _client.pokemon.getByUrl(url)));

    return pokemons;
  }
}
