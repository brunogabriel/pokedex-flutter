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
    // TODO check number range
    return 'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/thumbnails/${number.toString().padLeft(3, '0')}.png';
  }

  @override
  List<Object> get props => [name, number, url, types];
}
