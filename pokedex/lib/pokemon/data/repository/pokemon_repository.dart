import 'package:injectable/injectable.dart';
import 'package:pokedex/pokemon/data/models/pokemon_data.dart';
import 'package:pokedex/pokemon/data/service/pokemon_service.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository implements IPokemonRepository {
  final IPokemonService _service;

  PokemonRepository(this._service);
  @override
  Future<List<PokemonData>> getPokemons() =>
      _service.getPokemons().then((value) => value.results
          .map((response) => PokemonData.fromResponse(response))
          .toList());
}

abstract class IPokemonRepository {
  Future<List<PokemonData>> getPokemons();
}
