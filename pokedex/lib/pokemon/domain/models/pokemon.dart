import 'package:equatable/equatable.dart';
import 'package:pokedex/pokemon/data/models/pokemon_data.dart';

class Pokemon extends Equatable {
  final String name;
  final int number;
  final String thumbnail;

  const Pokemon(
    this.name,
    this.number,
    this.thumbnail,
  );

  @override
  List<Object> get props => [name, number, thumbnail];

  factory Pokemon.fromData(PokemonData data) => Pokemon(
        data.name,
        data.number,
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${data.number}.png",
      );
}
