import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/design/constants/pokedex_type_color.dart';
import 'package:pokedex_flutter/design/extensions/design_string_extensions.dart';

extension PokemonTypeExtensions on PokemonType {
  PokedexTypeColor get color => type.name.pokemonColor;
}
