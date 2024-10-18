import 'pokemon.dart';

class PokemonPageData {
  PokemonPageData({
    required this.hasNext,
    required this.pokemons,
  });

  final bool hasNext;
  final List<Pokemon> pokemons;
}
