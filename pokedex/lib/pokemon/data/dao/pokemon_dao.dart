import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/shared/database/pokemon_database.dart';

@Injectable(as: IPokemonDao)
class PokemonDao extends IPokemonDao {
  final PokemonDatabase _database;

  PokemonDao(this._database);

  @override
  Future<List<PokemonEntityData>> findByLimitAndOffset(
          int limit, int offset) async =>
      (_database.select(_database.pokemonEntity)
            ..orderBy([(field) => OrderingTerm(expression: field.number)])
            ..limit(limit, offset: offset))
          .get()
          .onError((_, stackTrace) => []);

  @override
  Future<void> insertOrReplace(List<PokemonEntityData> entities) async {
    for (final entity in entities) {
      await _database
          .into(_database.pokemonEntity)
          .insertOnConflictUpdate(PokemonEntityCompanion.insert(
            name: entity.name,
            number: entity.number,
            url: entity.url,
          ));
    }
  }
}

abstract class IPokemonDao {
  Future<void> insertOrReplace(List<PokemonEntityData> entities);
  Future<List<PokemonEntityData>> findByLimitAndOffset(int limit, int offset);
}
