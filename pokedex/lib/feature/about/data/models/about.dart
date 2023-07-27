import 'package:pokedex_flutter/feature/about/data/models/pokedex_data.dart';

class About {
  About({
    required this.description,
    required this.pokedexData,
  });

  final String description;
  final PokedexData pokedexData;
}
