import 'package:pokedex_flutter/design/constants/pokedex_type_color.dart';

extension DesignStringExtensions on String {
  PokedexTypeColor get pokemonColor => PokedexTypeColor.values.firstWhere(
        (element) => toLowerCase() == element.name,
        orElse: () => PokedexTypeColor.unknown,
      );
}
