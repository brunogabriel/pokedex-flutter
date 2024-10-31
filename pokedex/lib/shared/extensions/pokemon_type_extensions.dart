import 'package:pokedex/pokedex.dart';
import '../../design/constants/pokedex_type_color.dart';
import '../../design/extensions/design_string_extensions.dart';

extension PokemonTypeExtensions on PokemonType {
  PokedexTypeColor get color => type.name.pokemonColor;
}
