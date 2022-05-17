import 'package:pokedex/pokemon/data/response/pokemon_response.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

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

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + name.hashCode;
    result = 37 * result + thumbnail.hashCode;
    result = 37 * result + number.hashCode;
    return result;
  }

  factory Pokemon.fromResponse(PokemonResponse response) {
    final number = response.url.takeNumberFromPokemonUrl();
    final thumbnail =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$number.png";
    return Pokemon(name: response.name, thumbnail: thumbnail, number: number);
  }
}
