// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResultResponse _$PokemonResultResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonResultResponse(
      json['count'] as int,
      json['next'] as String?,
      json['previous'] as String?,
      (json['results'] as List<dynamic>)
          .map((e) => PokemonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonResultResponseToJson(
        PokemonResultResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
