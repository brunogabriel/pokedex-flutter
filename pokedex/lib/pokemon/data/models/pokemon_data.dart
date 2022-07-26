import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex/pokemon/data/service/response/pokemon_response.dart';
import 'package:pokedex/shared/database/pokemon_database.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

@immutable
class PokemonData extends Equatable {
  final String name;
  final int number;

  const PokemonData(
    this.name,
    this.number,
  );

  @override
  List<Object> get props => [name, number];

  factory PokemonData.fromResponse(PokemonResponse response) => PokemonData(
      response.name.firstLetterCapitalized(),
      response.url.getNumberFromPokemonUrl());

  factory PokemonData.fromEntity(PokemonEntityData entity) => PokemonData(
        entity.name.firstLetterCapitalized(),
        entity.number,
      );
}
