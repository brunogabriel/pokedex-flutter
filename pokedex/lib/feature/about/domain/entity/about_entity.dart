import 'package:pokedex/pokedex.dart';

class AboutEntity {
  AboutEntity({
    required this.pokemon,
    required this.pokemonSpecies,
    required this.weaknesses,
  });

  final Pokemon pokemon;
  final PokemonSpecies? pokemonSpecies;
  final List<String> weaknesses;
}
