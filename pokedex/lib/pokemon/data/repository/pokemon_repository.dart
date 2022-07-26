import 'package:injectable/injectable.dart';
import 'package:pokedex/pokemon/data/dao/pokemon_dao.dart';
import 'package:pokedex/pokemon/data/models/pokemon_data.dart';
import 'package:pokedex/pokemon/data/service/pokemon_service.dart';
import 'package:pokedex/shared/database/pokemon_database.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository implements IPokemonRepository {
  final IPokemonService _service;
  final IPokemonDao _dao;

  PokemonRepository(
    this._service,
    this._dao,
  );

  @override
  Future<List<PokemonData>> getPokemons() async {
    final databaseResponse = await _dao.findAll().then(
        (entities) => entities.map((e) => PokemonData.fromEntity(e)).toList());

    if (databaseResponse.isNotEmpty) {
      return databaseResponse;
    } else {
      var entities = await _service.getPokemons().then((value) => value.results
          .map((response) => PokemonEntityData(
                name: response.name,
                number: response.url.getNumberFromPokemonUrl(),
                url: response.url,
              ))
          .toList());

      return _dao.insertOrReplace(entities).then((_) =>
          entities.map((entity) => PokemonData.fromEntity(entity)).toList());
    }
  }
}

abstract class IPokemonRepository {
  Future<List<PokemonData>> getPokemons();
}
