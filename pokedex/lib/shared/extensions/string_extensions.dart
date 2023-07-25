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
}
