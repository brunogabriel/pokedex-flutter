import 'package:json_annotation/json_annotation.dart';

part 'pokemon_response.g.dart';

@JsonSerializable()
class PokemonResponse {
  final String name, url;

  const PokemonResponse({
    required this.name,
    required this.url,
  });

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
