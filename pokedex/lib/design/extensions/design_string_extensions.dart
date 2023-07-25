import 'package:flutter/material.dart';
import 'package:pokedex/design/constants/pokedex_type_color.dart';

extension DesignStringExtensions on String {
  Color pokemonColor() => PokedexTypeColor.values
      .firstWhere((element) => toLowerCase() == element.name,
          orElse: () => PokedexTypeColor.unknown)
      .color;
}
