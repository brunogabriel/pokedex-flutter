import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class PokemonDetailsResponse extends Equatable {
  const PokemonDetailsResponse(this.id, this.name, this.types);

  factory PokemonDetailsResponse.fromJson(Map<String, dynamic> json) =>
      PokemonDetailsResponse(
        json['id'] as int,
        json['name'] as String,
        (json['types'] as List<dynamic>)
            .map((e) => PokemonTypesResponse.fromJson(e))
            .toList(),
      );

  final int id;
  final String name;
  final List<PokemonTypesResponse> types;

  String get spriteUrl =>
      'https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/$id.svg';

  @override
  List<Object?> get props => [name, types];
}

@immutable
class PokemonTypeResponse extends Equatable {
  const PokemonTypeResponse(this.name, this.url);

  factory PokemonTypeResponse.fromJson(Map<String, dynamic> json) =>
      PokemonTypeResponse(
        json['name'] as String,
        json['url'] as String,
      );

  final String name;
  final String url;

  @override
  List<Object> get props => [name, url];
}

@immutable
class PokemonTypesResponse extends Equatable {
  const PokemonTypesResponse(this.slot, this.type);

  factory PokemonTypesResponse.fromJson(Map<String, dynamic> json) =>
      PokemonTypesResponse(
        json['slot'] as int,
        PokemonTypeResponse.fromJson(json['type'] as dynamic),
      );

  final int slot;
  final PokemonTypeResponse type;

  @override
  List<Object> get props => [slot, type];
}
