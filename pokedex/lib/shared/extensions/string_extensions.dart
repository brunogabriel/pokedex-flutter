import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:pokedex/design/pokedex_type_color.dart';

extension StringExtensions on String {
  String asset() {
    if (kIsWeb && !kDebugMode) {
      return 'assets/$this';
    }
    return '${!kIsWeb ? 'assets/' : ''}$this';
  }

  Color pokemonColor() => PokedexTypeColor.values
      .firstWhere((element) => toLowerCase() == element.name,
          orElse: () => PokedexTypeColor.unknown)
      .color;

  String capitalize() =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';
}
