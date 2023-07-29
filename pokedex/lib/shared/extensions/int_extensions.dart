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

  double get kg => this / 10.0;
  double get lb => (this / 10.0) * 2.20462;
  double get meter => this / 10.0;

  int get cm => this * 10;

  String cmToFeedAndInches() {
    double inches = this * 0.393701;
    int feet = (inches / 12).floor();
    int remainingInches = (inches % 12).round();
    String feetAndInches = "$feet' $remainingInches\"";
    return feetAndInches;
  }
}
