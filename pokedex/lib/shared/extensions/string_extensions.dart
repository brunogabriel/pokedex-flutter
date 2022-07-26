extension StringExtension on String {
  String firstLetterCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  int getNumberFromPokemonUrl() {
    try {
      final regex = RegExp(r'^https://pokeapi.co/api/v2/pokemon/([0-9]+)/$');
      final match = regex.firstMatch(this);
      final number = int.parse(match?.group(1) ?? "0");
      return number;
    } catch (_) {
      return 0;
    }
  }
}
