import 'package:pokedex/pokedex.dart';

class EvolutionEntity {
  EvolutionEntity({
    required this.pokemon,
    required this.evolutions,
  });

  final List<ChainLink> evolutions;
  final Pokemon pokemon;
}
