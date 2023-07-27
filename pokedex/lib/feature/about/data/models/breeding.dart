class Breeding {
  Breeding({
    required this.eggGroups,
    required this.hatchCounter,
    required this.genderRate,
  });

  final List<String> eggGroups;
  final int hatchCounter;
  final int genderRate;

  double get femaleRate => (genderRate / 8.0) * 100.0;
  double get maleRate => 100.0 - femaleRate;
}
