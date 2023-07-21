import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/pokemons/data/service/response/pokemon_response.dart';
import 'package:pokedex/feature/pokemons/data/service/response/types_response.dart';
import 'package:pokedex/shared/models/pagination_result.dart';

abstract class PokemonService {
  Future<PaginationResult<PokemonResponse>> getPokemons(int limit, int offset);
  Future<TypesResponse> getTypes(int number);
}

@Injectable(as: PokemonService)
class PokemonServiceImpl implements PokemonService {
  @override
  Future<PaginationResult<PokemonResponse>> getPokemons(int limit, int offset) {
    throw UnimplementedError();
  }

  @override
  Future<TypesResponse> getTypes(int number) {
    throw UnimplementedError();
  }
}
