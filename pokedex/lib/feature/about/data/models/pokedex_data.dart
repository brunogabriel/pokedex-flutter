import 'package:pokedex/feature/about/data/models/ability.dart';
import 'package:pokedex/feature/about/data/models/breeding.dart';
import 'package:pokedex/feature/about/data/models/trainning.dart';

class PokedexData {
  PokedexData({
    required this.species,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.weaknesses,
    required this.trainning,
    required this.breeding,
  });

  final String species;
  final double height;
  final double weight;
  final List<Ability> abilities;
  final List<String> weaknesses;
  final Trainning trainning;
  final Breeding breeding;
}
