// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/shared/database/pokemon_database.dart';

part 'pokemon_response.g.dart';

@JsonSerializable()
class PokemonResponse {
  final String name, url;

  const PokemonResponse({
    required this.name,
    required this.url,
  });

  @override
  bool operator ==(other) {
    return (other is PokemonResponse) && other.name == name && other.url == url;
  }

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + name.hashCode;
    result = 37 * result + url.hashCode;
    return result;
  }

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);

  factory PokemonResponse.fromEntity(PokemonEntityData entity) =>
      PokemonResponse(name: entity.name, url: entity.url);
}
