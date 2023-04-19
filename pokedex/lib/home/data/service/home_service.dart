import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/home/data/models/pokemon_result_response.dart';

abstract class HomeService {
  Future<PokemonResultResponse> getPokemons(int offset);
}

@Injectable(as: HomeService)
class HomeServiceImpl extends HomeService {
  HomeServiceImpl(this._client);

  final int _limit = 18;

  final Dio _client;
  @override
  Future<PokemonResultResponse> getPokemons(int offset) => _client
      .get('/pokemon?limit=$_limit&offset=$offset')
      .then((value) => PokemonResultResponse.fromJson(value.data));
}
