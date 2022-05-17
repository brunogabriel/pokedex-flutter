import 'package:injectable/injectable.dart';
import 'package:pokedex/pokemon/data/dao/pokemon_dao.dart';
import 'package:pokedex/pokemon/data/mapper/pokemon_entity_data_mapper.dart';

import '../response/pokemon_response.dart';
import '../service/pokemon_service.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository implements IPokemonRepository {
  final IPokemonService _service;
  final IPokemonDao _dao;

  const PokemonRepository(
    this._service,
    this._dao,
  );

  @override
  Future<List<PokemonResponse>> fetchPokemons(int offset) async {
    final databaseResponse = await _dao
        .findByLimitAndOffset(IPokemonService.pageSize, offset)
        .then((value) =>
            value.map((e) => PokemonResponse.fromEntity(e)).toList());

    if (databaseResponse.isEmpty) {
      return await _service
          .getPokemons(offset)
          .then((value) => _saveResponse(value));
    } else {
      return databaseResponse;
    }
  }

  Future<List<PokemonResponse>> _saveResponse(
      List<PokemonResponse> response) async {
    return await _dao
        .insertOrReplace(response.map((e) => entityFromResponse(e)).toList())
        .then((value) => response);
  }
}

abstract class IPokemonRepository {
  Future<List<PokemonResponse>> fetchPokemons(int offset);
}
