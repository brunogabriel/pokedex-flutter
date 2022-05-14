import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokemon/data/response/pokemon_response.dart';
import 'package:pokedex/pokemon/data/response/pokemon_result_response.dart';
import 'package:pokedex/shared/network/exception/network_exception.dart';

@Injectable(as: IPokemonService)
class PokemonService implements IPokemonService {
  final Dio _client;

  const PokemonService(this._client);

  @override
  Future<List<PokemonResponse>> getPokemons(int offset) async => await _client
      .get('/pokemon?limit=${IPokemonService.pageSize}&offset=$offset')
      .then((response) => response.statusCode == 200
          ? PokemonResultResponse.fromJson(response.data).results
          : throw NetworkException(response.statusCode));
}

abstract class IPokemonService {
  static const int pageSize = 30;

  Future<List<PokemonResponse>> getPokemons(int offset);
}
