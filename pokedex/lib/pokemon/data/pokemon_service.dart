import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokemon/data/models/pokemon_details_response.dart';
import 'package:pokedex/pokemon/data/models/pokemon_result_response.dart';

abstract class PokemonService {
  Future<PokemonResultResponse> getPokemons(int offset);
  Future<PokemonDetailsResponse> getPokemonDetails(String name);
}

@Injectable(as: PokemonService)
class PokemonServiceImpl implements PokemonService {
  PokemonServiceImpl(this._client);

  final int _limit = 18;
  final Dio _client;

  @override
  Future<PokemonDetailsResponse> getPokemonDetails(String name) => _client
      .get('/pokemon/$name')
      .then((value) => PokemonDetailsResponse.fromJson(value.data));

  @override
  Future<PokemonResultResponse> getPokemons(int offset) => _client
      .get('/pokemon?limit=$_limit&offset=$offset')
      .then((value) => PokemonResultResponse.fromJson(value.data));
}
