import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/pokemons/data/pokemons_repository.dart';

abstract class PokemonsUseCase {
  Future<List<Pokemon>> fetchPokemons(int limit, int offset);
}

@Injectable(as: PokemonsUseCase)
class PokemonsUseCaseImpl implements PokemonsUseCase {
  PokemonsUseCaseImpl(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  @override
  Future<List<Pokemon>> fetchPokemons(int limit, int offset) async {
    final resource =
        await _pokemonRepository.getPokemonsResource(limit, offset);

    final pokemons = await _pokemonRepository
        .getPokemons(resource.results.map((e) => e.url).toList());

    return pokemons;
  }
}
