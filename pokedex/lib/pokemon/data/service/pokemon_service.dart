import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokemon/data/service/response/pokemon_result_response.dart';

@Injectable(as: IPokemonService)
class PokemonService implements IPokemonService {
  final Dio _service;

  const PokemonService(this._service);

  @override
  Future<PokemonResultResponse> getPokemons() => _service
      .get('/pokemon?limit=250&offset=0')
      .then((value) => PokemonResultResponse.fromJson(value.data));
}

abstract class IPokemonService {
  Future<PokemonResultResponse> getPokemons();
}
