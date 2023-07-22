import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/pokemons/data/models/pokemon.dart';
import 'package:pokedex/feature/pokemons/data/models/type.dart';
import 'package:pokedex/feature/pokemons/data/service/pokemons_service.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons(int limit, int offset);
  Future<List<Type>> getTypes(int number);
}

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._service);

  final PokemonService _service;
  @override
  Future<List<Pokemon>> getPokemons(int limit, int offset) async {
    throw Exception();
  }

  @override
  Future<List<Type>> getTypes(int number) async {
    final types = await _service.getTypes(number);
    return types.types
        .map((e) => e.type)
        .map((e) => Type(name: e.name, url: e.url))
        .toList();
  }
}
