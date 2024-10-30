import 'package:pokedex/pokedex.dart';

class EvolutionEntity {
  EvolutionEntity({
    required this.pokemon,
    required this.evolutions,
  });

  final List<EvolutionDescriptionEntity> evolutions;
  final Pokemon pokemon;
}

class EvolutionDescriptionEntity {
  EvolutionDescriptionEntity({
    required this.from,
    required this.fromNumber,
    required this.to,
    required this.toNumber,
    required this.cause,
    required this.details,
    required this.sprites,
  });

  final String from;
  final int fromNumber;
  final String to;
  final int toNumber;
  final String cause;
  final String details;
  final List<String> sprites;
}
