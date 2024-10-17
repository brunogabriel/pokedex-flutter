import 'package:json/json.dart';

@JsonCodable()
class PokemonListResponse {
  PokemonListResponse({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}
