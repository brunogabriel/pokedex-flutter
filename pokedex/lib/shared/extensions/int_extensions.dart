extension IntExtensions on int {
  String get thumbnailUrl {
    final stringNumber = toString();
    if (this < 905) {
      return 'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/thumbnails/${stringNumber.padLeft(3, '0')}.png';
    }
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$stringNumber.png';
  }

  String get pokenumber => '#${toString().padLeft(4, '0')}';
}
