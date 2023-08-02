import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/cache/application_cache.dart';

abstract class SearchUseCase {
  Future<List<NamedAPIResource>> getAllPokemons();
}

@Injectable(as: SearchUseCase)
class SearchUseCaseImpl extends SearchUseCase {
  SearchUseCaseImpl(this._pokedex, this._cache);

  final Pokedex _pokedex;
  final ApplicationCache _cache;
  final String _key = 'PokemonResources';

  @override
  Future<List<NamedAPIResource>> getAllPokemons() async {
    final cachedResource = _cache.getValue(_key);
    final List<NamedAPIResource> results;
    if (cachedResource != null && cachedResource is List<NamedAPIResource>) {
      results = cachedResource;
    } else {
      final resource = await _pokedex.pokemon.getAll();
      results = resource.results;
      _cache.putValue(_key, results);
    }
    return results;
  }
}
