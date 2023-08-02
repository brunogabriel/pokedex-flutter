import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class PokemonsUseCase {
  Future<List<Pokemon>> fetchPokemons(int limit, int offset);
}

@Injectable(as: PokemonsUseCase)
class PokemonsUseCaseImpl implements PokemonsUseCase {
  PokemonsUseCaseImpl(this._pokedex);

  final Pokedex _pokedex;

  @override
  Future<List<Pokemon>> fetchPokemons(int limit, int offset) async {
    final resourcePage = await _pokedex.pokemon.getPage(
      limit: limit,
      offset: offset,
    );

    final pokemons = await Future.wait(
      resourcePage.results.map((e) => _pokedex.pokemon.getByUrl(e.url)),
    );

    return pokemons;
  }
}
