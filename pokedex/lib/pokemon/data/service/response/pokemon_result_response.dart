import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/pokemon/data/service/response/pokemon_response.dart';
import 'package:pokedex/shared/network/api/api_result.dart';

part 'pokemon_result_response.g.dart';

@immutable
@JsonSerializable()
class PokemonResultResponse extends ApiResult<PokemonResponse> {
  const PokemonResultResponse(
      super.count, super.next, super.previous, super.results);

  factory PokemonResultResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultResponseFromJson(json);
}
