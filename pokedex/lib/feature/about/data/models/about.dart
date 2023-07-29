import 'package:pokedex/pokedex.dart';

class About {
  About({
    required this.pokemon,
    required this.pokemonSpecies,
    required this.weaknesses,
  });

  final Pokemon pokemon;
  final PokemonSpecies pokemonSpecies;
  final List<String> weaknesses;
}
