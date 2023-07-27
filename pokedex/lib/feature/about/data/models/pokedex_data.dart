import 'package:pokedex/feature/about/data/models/ability.dart';

class PokedexData {
  PokedexData({
    required this.species,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.weaknesses,
  });

  final String species;
  final double height;
  final double weight;
  final List<Ability> abilities;
  final List<String> weaknesses;
}
