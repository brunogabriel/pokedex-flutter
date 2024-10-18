import '../model/pokemon_page_data.dart';

abstract interface class PokemonListRepository {
  Future<PokemonPageData> getPokemons({
    int limit = 100,
    int offset = 0,
  });
}
