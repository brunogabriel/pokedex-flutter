import 'package:equatable/equatable.dart';
import 'package:pokedex/shared/data/pokemon_type.dart';

class Pokemon extends Equatable {
  const Pokemon({
    required this.name,
    required this.number,
    required this.types,
  });

  final String name;
  final int number;
  final List<PokemonType> types;

  @override
  List<Object> get props => [
        name,
        number,
        types,
      ];
}
