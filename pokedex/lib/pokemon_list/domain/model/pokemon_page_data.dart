import 'package:pokedex/pokemon_list/domain/model/pokemon.dart';

class PokemonPageData {
  PokemonPageData({
    required this.hasNext,
    required this.pokemons,
  });

  final bool hasNext;
  final List<Pokemon> pokemons;
}
