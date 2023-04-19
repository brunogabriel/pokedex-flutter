import 'package:flutter/material.dart';
import 'package:pokedex/home/data/models/pokemon_response.dart';
import 'package:pokedex/shared/api_result.dart';

@immutable
class PokemonResultResponse extends ApiResult<PokemonResponse> {
  const PokemonResultResponse(
      super.count, super.next, super.prev, super.results);

  factory PokemonResultResponse.fromJson(Map<String, dynamic> json) =>
      PokemonResultResponse(
        json['count'] as int,
        json['next'] as String?,
        json['prev'] as String?,
        (json['results'] as List<dynamic>)
            .map((e) => PokemonResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
