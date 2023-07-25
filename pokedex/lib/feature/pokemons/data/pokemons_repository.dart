import 'package:injectable/injectable.dart';
import 'package:pokedex/shared/data/pokemon_type.dart';
import 'package:pokedex/feature/pokemons/data/service/pokemons_service.dart';
import 'package:pokedex/feature/pokemons/data/service/response/extensions/pokemon_response_extension.dart';
import 'package:pokedex/shared/data/pokemon.dart';
import 'package:pokedex/shared/extensions/list_extensions.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons(int limit, int offset);
}

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._service);

  final PokemonService _service;
  @override
  Future<List<Pokemon>> getPokemons(int limit, int offset) async {
    final pokemonsResponse = await _service
        .getPokemons(limit, offset)
        .then((value) => value.results);
    final typesResponse = await Future.wait(
        pokemonsResponse.map((e) => _service.getTypes(e.url)));

    return pokemonsResponse
        .zip(typesResponse)
        .map(
          (pair) => Pokemon(
            name: pair.first.name.capitalize(),
            number: pair.first.getNumberFromPokemonUrl(),
            types: pair.second.types
                .map((e) => PokemonType(name: e.type.name, url: e.type.url))
                .toList(),
          ),
        )
        .toList();
  }
}
