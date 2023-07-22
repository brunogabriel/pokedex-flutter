import 'package:pokedex/feature/pokemons/data/service/response/pokemon_response.dart';

extension PokemonResponseExtension on PokemonResponse {
  String firstLetterCapitalized() =>
      name.isNotEmpty ? '${name[0].toUpperCase()}${name.substring(1)}' : '';

  int getNumberFromPokemonUrl() {
    try {
      final regex = RegExp(r'^https://pokeapi.co/api/v2/pokemon/([0-9]+)/$');
      final match = regex.firstMatch(url);
      final number = int.parse(match?.group(1) ?? '0');
      return number;
    } catch (_) {
      return 0;
    }
  }
}
