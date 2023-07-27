import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;

extension StringExtensions on String {
  String asset() {
    if (kIsWeb && !kDebugMode) {
      return 'assets/$this';
    }
    return '${!kIsWeb ? 'assets/' : ''}$this';
  }

  String capitalize() =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';

  String capitalizeKebabCase() =>
      split('-').map((e) => e.capitalize()).join(' ');

  String replaceScapeChars([String newChar = ' ']) =>
      replaceAll(RegExp(r'[\n\t\f]'), newChar).trim();
}
