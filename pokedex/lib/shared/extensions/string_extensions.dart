import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;

extension StringExtensions on String {
  // Assets
  String asset() {
    if (kIsWeb && !kDebugMode) {
      return 'assets/$this';
    }
    return '${!kIsWeb ? 'assets/' : ''}$this';
  }

  // Capitalize
  String capitalize() =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';

  String capitalizeKebabCase() =>
      split('-').map((e) => e.capitalize()).join(' ');

  // Replace
  String replaceScapeChars([String newChar = ' ']) =>
      replaceAll(RegExp(r'[\n\t\f]'), newChar).trim();

  // Number
  int getNumberFromPokemonUrl() {
    try {
      final regex = RegExp(r'^https://pokeapi.co/api/v2/.*?/([0-9]+)/$');
      final match = regex.firstMatch(this);
      final number = int.parse(match?.group(1) ?? '0');
      return number;
    } catch (_) {
      return 0;
    }
  }
}

extension StringNullExtensions on String? {
  // Thumbnail URLs
  String get itemThumbnail =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/$this.png';
}
