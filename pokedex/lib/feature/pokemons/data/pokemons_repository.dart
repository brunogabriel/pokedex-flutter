import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons(int limit, int offset);
}

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<List<Pokemon>> getPokemons(int limit, int offset) async {
    final resource =
        await Pokedex().pokemon.getPage(limit: limit, offset: offset);

    final pokemons = await Future.wait(resource.results
        .map((e) => e.url)
        .map((e) => Pokedex().pokemon.getByUrl(e)));

    return pokemons;
  }
}
