import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokemon/data/response/pokemon_response.dart';
import 'package:pokedex/pokemon/data/response/pokemon_result_response.dart';

@Injectable(as: IPokemonService)
class PokemonService implements IPokemonService {
  final Dio _client;

  const PokemonService(this._client);

  @override
  Future<List<PokemonResponse>> getPokemons() async => await _client
      .get('/pokemon?limit=250')
      .then((response) => response.statusCode == 200
          ? PokemonResultResponse.fromJson(response.data).results
          : throw UnimplementedError());
}

abstract class IPokemonService {
  Future<List<PokemonResponse>> getPokemons();
}
