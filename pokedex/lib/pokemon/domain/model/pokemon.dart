import 'package:pokedex/pokemon/data/response/pokemon_response.dart';

class Pokemon {
  final String name, thumbnail;
  final int number;

  Pokemon({
    required this.name,
    required this.thumbnail,
    required this.number,
  });

  @override
  bool operator ==(other) {
    return (other is Pokemon) &&
        other.name == name &&
        other.thumbnail == thumbnail &&
        other.number == number;
  }

  factory Pokemon.fromResponse(PokemonResponse response) {
    final regex = RegExp(r'^https://pokeapi.co/api/v2/pokemon/([0-9]+)/$');
    final match = regex.firstMatch(response.url);
    final number = int.parse(match?.group(1) ?? "0");
    final thumbnail =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png";

    return Pokemon(name: response.name, thumbnail: thumbnail, number: number);
  }
}
