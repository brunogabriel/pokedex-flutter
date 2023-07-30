import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/stats/domain/entities/stats_value_entity.dart';

class StatsEntity {
  StatsEntity({
    required this.pokemon,
    required this.pokemonSpecies,
    required this.statsMap,
    required this.minStat,
    required this.summation,
  });

  final Pokemon pokemon;
  final PokemonSpecies pokemonSpecies;
  final Map<String, StatsValueEntity?> statsMap;
  final int minStat;
  final int summation;
}
