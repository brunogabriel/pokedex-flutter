import 'package:pokedex/design/constants/pokedex_type_color.dart';
import 'package:pokedex/design/extensions/design_string_extensions.dart';
import 'package:pokedex/shared/data/pokemon_type.dart';

extension PokemonTypeExtensions on PokemonType {
  PokedexTypeColor get color => name.pokemonColor;
}
