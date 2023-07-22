import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/pokemons/data/service/response/pokemons_pagination_response.dart';
import 'package:pokedex/feature/pokemons/data/service/response/types_response.dart';

abstract class PokemonService {
  Future<PokemonsPaginationResponse> getPokemons(int limit, int offset);
  Future<TypesResponse> getTypes(String url);
}

@Injectable(as: PokemonService)
class PokemonServiceImpl implements PokemonService {
  PokemonServiceImpl(this._dio);

  final Dio _dio;

  @override
  Future<PokemonsPaginationResponse> getPokemons(int limit, int offset) async {
    final response = await _dio
        .get('pokemon', queryParameters: {'limit': limit, 'offset': offset});

    return PokemonsPaginationResponse.fromJson(response.data);
  }

  @override
  Future<TypesResponse> getTypes(String url) async {
    final response = await _dio.get(url);
    return TypesResponse.fromJson(response.data);
  }
}
