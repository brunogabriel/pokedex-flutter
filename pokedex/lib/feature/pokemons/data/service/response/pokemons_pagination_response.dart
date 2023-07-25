import 'package:pokedex/feature/pokemons/data/service/response/pokemon_response.dart';

class PokemonsPaginationResponse {
  PokemonsPaginationResponse(
      this.count, this.next, this.previous, this.results);

  factory PokemonsPaginationResponse.fromJson(Map<String, dynamic> json) =>
      PokemonsPaginationResponse(
        json['count'] as int?,
        json['next'] as String?,
        json['previous'] as String?,
        (json['results'] as List<dynamic>)
            .map((e) => PokemonResponse.fromJson(e))
            .toList(),
      );

  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonResponse> results;
}
