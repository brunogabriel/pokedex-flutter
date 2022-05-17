import 'package:pokedex/pokemon/data/response/pokemon_response.dart';
import 'package:pokedex/shared/database/pokemon_database.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

PokemonEntityData entityFromResponse(PokemonResponse response) =>
    PokemonEntityData(
      name: response.name,
      number: response.url.takeNumberFromPokemonUrl(),
      url: response.url,
    );
