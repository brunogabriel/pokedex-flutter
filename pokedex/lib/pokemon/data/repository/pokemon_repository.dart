import 'package:injectable/injectable.dart';

import '../response/pokemon_response.dart';
import '../service/pokemon_service.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository implements IPokemonRepository {
  final IPokemonService service;

  PokemonRepository({required this.service});

  @override
  Future<List<PokemonResponse>> fetchPokemons() async =>
      await service.getPokemons();
}

abstract class IPokemonRepository {
  Future<List<PokemonResponse>> fetchPokemons();
}
