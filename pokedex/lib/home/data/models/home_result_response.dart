import 'package:equatable/equatable.dart';
import 'package:pokedex/pokemon/data/models/pokemon_details_response.dart';

class HomeResponseResponse extends Equatable {
  const HomeResponseResponse(this.count, this.details);

  final int count;
  final List<PokemonDetailsResponse> details;

  @override
  List<Object> get props => [count, details];
}
