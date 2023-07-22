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

  @override
  List<Object> get props => [name, number, url, types];
}
