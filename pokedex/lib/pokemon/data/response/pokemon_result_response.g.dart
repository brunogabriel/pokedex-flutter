// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResultResponse _$PokemonResultResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonResultResponse(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonResultResponseToJson(
        PokemonResultResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };
