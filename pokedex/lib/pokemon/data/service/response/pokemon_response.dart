import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_response.g.dart';

@immutable
@JsonSerializable()
class PokemonResponse extends Equatable {
  final String name;
  final String url;

  const PokemonResponse(this.name, this.url);

  @override
  List<Object> get props => [name, url];

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);
}
