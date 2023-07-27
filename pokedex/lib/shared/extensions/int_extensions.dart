extension IntExtensions on int {
  String get thumbnailUrl {
    final stringNumber = toString();
    if (this < 905) {
      return 'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/thumbnails/${stringNumber.padLeft(3, '0')}.png';
    }
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$stringNumber.png';
  }

  String get pokenumber => '#${toString().padLeft(4, '0')}';

  double get femaleRate => (this / 8.0) * 100.0;
  double get maleRate => 100.0 - femaleRate;
}
