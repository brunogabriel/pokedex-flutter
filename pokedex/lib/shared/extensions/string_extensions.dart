extension StringExtension on String {
  String firstLetterCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
}
