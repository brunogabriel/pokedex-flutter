import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class PokemonRepository {
  Future<NamedAPIResourceList> getPokemonsResource(int limit, int offset);
  Future<List<Pokemon>> getPokemons(List<String> urls);
}

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._client);

  final Pokedex _client;

  @override
  Future<List<Pokemon>> getPokemons(List<String> urls) async {
    final pokemons =
        await Future.wait(urls.map((url) => _client.pokemon.getByUrl(url)));

    return pokemons;
  }

  @override
  Future<NamedAPIResourceList> getPokemonsResource(
      int limit, int offset) async {
    final resources =
        await _client.pokemon.getPage(limit: limit, offset: offset);

    return resources;
  }
}
