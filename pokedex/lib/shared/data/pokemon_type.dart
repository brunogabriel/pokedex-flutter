import 'package:equatable/equatable.dart';

class PokemonType extends Equatable {
  const PokemonType({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  List<Object> get props => [name, url];
}
