import 'package:equatable/equatable.dart';
import 'package:pokedex/feature/pokemons/data/models/type.dart';

class Pokemon extends Equatable {
  const Pokemon({
    required this.name,
    required this.number,
    required this.url,
    required this.types,
  });

  final String name;
  final int number;
  final String url;
  final List<Type> types;

  String get thumbnailUrl {
    if (number < 905) {
      return 'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/thumbnails/${number.toString().padLeft(3, '0')}.png';
    }

    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${number.toString()}.png';
  }

  @override
  List<Object> get props => [name, number, url, types];
}
