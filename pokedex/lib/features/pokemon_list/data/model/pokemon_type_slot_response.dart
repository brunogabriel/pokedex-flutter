import 'package:json/json.dart';

import '../../../../common/api/model/named_api_response.dart';

@JsonCodable()
class PokemonTypeSlotResponse {
  PokemonTypeSlotResponse({
    required this.slot,
    required this.type,
  });

  final int slot;
  final NamedApiResponse type;
}
