import 'package:dio/dio.dart';

import '../../../common/api/model/named_api_response.dart';
import '../domain/boundary/pokemon_list_repository.dart';
import '../domain/model/pokemon.dart';
import '../domain/model/pokemon_page_data.dart';

class PokemonListRepositoryImpl implements PokemonListRepository {
  PokemonListRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<PokemonPageData> getPokemons({int limit = 100, int offset = 0}) async {
    final response = await dio.get('pokemon', data: {
      'limit': limit,
      'offset': offset,
    });

    final hasNext = response.data['next'] != null;
    final results = response.data['results'] as List<dynamic>;
    final namedApiResponse =
        results.map((json) => NamedApiResponse.fromJson(json)).toList();

    return PokemonPageData(
      hasNext: hasNext,
      pokemons: namedApiResponse
          .map((element) => Pokemon(name: element.name, number: 0))
          .toList(),
    );
  }
}
