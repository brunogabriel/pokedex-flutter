import 'package:json_annotation/json_annotation.dart';

import 'pokemon_response.dart';
part 'pokemon_result_response.g.dart';

@JsonSerializable()
class PokemonResultResponse {
  final int count;
  final List<PokemonResponse> results;

  const PokemonResultResponse({
    required this.count,
    required this.results,
  });

  factory PokemonResultResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResultResponseToJson(this);
}
