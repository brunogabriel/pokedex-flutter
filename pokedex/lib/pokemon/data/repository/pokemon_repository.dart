import 'package:injectable/injectable.dart';

import '../response/pokemon_response.dart';
import '../service/pokemon_service.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository implements IPokemonRepository {
  final IPokemonService _service;

  const PokemonRepository(
    this._service,
  );

  @override
  Future<List<PokemonResponse>> fetchPokemons(int offset) async =>
      await _service.getPokemons(offset);
}

abstract class IPokemonRepository {
  Future<List<PokemonResponse>> fetchPokemons(int offset);
}
