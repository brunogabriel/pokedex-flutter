import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/pokemons/data/models/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons(int limit, int offset);
  Future<List<Type>> getTypes(int number);
}

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<List<Pokemon>> getPokemons(int limit, int offset) {
    // TODO: implement getPokemons
    throw UnimplementedError();
  }

  @override
  Future<List<Type>> getTypes(int number) {
    // TODO: implement getTypes
    throw UnimplementedError();
  }
}
