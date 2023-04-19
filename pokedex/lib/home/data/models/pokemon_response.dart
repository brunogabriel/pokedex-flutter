import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class PokemonResponse extends Equatable {
  const PokemonResponse(this.name, this.url);

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      PokemonResponse(json['name'] as String, json['url'] as String);

  final String name;
  final String url;

  @override
  List<Object> get props => [name, url];
}
