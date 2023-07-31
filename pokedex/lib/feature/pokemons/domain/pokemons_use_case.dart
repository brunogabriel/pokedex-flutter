import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/pokemons/data/pokemons_repository.dart';

abstract class PokemonsUseCase {
  Future<List<Pokemon>> fetchPokemons(int limit, int offset, [String? query]);
}

@Injectable(as: PokemonsUseCase)
class PokemonsUseCaseImpl implements PokemonsUseCase {
  PokemonsUseCaseImpl(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  @override
  Future<List<Pokemon>> fetchPokemons(int limit, int offset,
      [String? query]) async {
    final resource =
        await _pokemonRepository.getPokemonsResource(limit, offset);

    final List<String> urls;
    if (query != null) {
      final filteredResources = resource.results
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      urls = filteredResources.map((e) => e.url).toList();
    } else {
      urls = resource.results.map((e) => e.url).toList();
    }
    return _pokemonRepository.getPokemons(urls);
  }
}
