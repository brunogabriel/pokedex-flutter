import 'package:json/json.dart';

import 'pokemon_type_slot_response.dart';

@JsonCodable()
class PokemonListDetailsResponse {
  PokemonListDetailsResponse({
    required this.name,
    required this.types,
    required this.id,
  });

  final String name;
  final List<PokemonTypeSlotResponse> types;
  final int id;
}
