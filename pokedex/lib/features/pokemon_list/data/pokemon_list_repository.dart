import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../common/api/model/named_api_response.dart';
import '../domain/boundary/pokemon_list_repository.dart';
import '../domain/model/pokemon.dart';
import '../domain/model/pokemon_page_data.dart';
import 'model/pokemon_list_details_response.dart';

@Injectable(as: PokemonListRepository)
class PokemonListRepositoryImpl implements PokemonListRepository {
  PokemonListRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<PokemonPageData> getPokemons({int limit = 100, int offset = 0}) async {
    final response = await dio.get('pokemon', queryParameters: {
      'limit': limit,
      'offset': offset,
    });

    final hasNext = response.data['next'] != null;
    final results = response.data['results'] as List<dynamic>;
    final namedApiResponse =
        results.map((json) => NamedApiResponse.fromJson(json)).toList();

    final pokemonResponses = await Future.wait(
      namedApiResponse.map((e) => dio.get(e.url)),
    );

    final pokemons = pokemonResponses
        .map((resp) => PokemonListDetailsResponse.fromJson(resp.data))
        .toList();

    return PokemonPageData(
      hasNext: hasNext,
      pokemons: pokemons
          .map(
            (element) => Pokemon(
              name: element.name,
              number: element.id,
              types: element.types.map((e) => e.type.name).toList(),
            ),
          )
          .toList(),
    );
  }
}
