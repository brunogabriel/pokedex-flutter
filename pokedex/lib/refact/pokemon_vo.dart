class PokemonVO {
  PokemonVO({
    required this.name,
    required this.number,
    required this.types,
    required this.thumbnailImage,
  });

  final String name;
  final int number;
  final List<String> types;
  final String thumbnailImage;
}
