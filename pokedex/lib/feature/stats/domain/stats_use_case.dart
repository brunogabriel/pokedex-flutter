import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/stats/data/stats_repository.dart';
import 'package:pokedex_flutter/feature/stats/domain/entities/stats_entity.dart';
import 'package:pokedex_flutter/feature/stats/domain/entities/stats_value_entity.dart';
import 'package:pokedex_flutter/shared/data/pair.dart';
import 'package:pokedex_flutter/shared/extensions/int_extensions.dart';
import 'package:pokedex_flutter/shared/extensions/type_extensions.dart';

abstract class StatsUseCase {
  Future<StatsEntity> getStats(Pokemon pokemon);
}

@Injectable(as: StatsUseCase)
class StatsUseCaseImpl implements StatsUseCase {
  StatsUseCaseImpl(this._repository);

  final StatsRepository _repository;

  @override
  Future<StatsEntity> getStats(Pokemon pokemon) async {
    final pokemonSpecies = await _repository.getPokemonSpecies(pokemon.id);
    final allTypes = await _repository.getTypesNames();
    final types = await _repository
        .getTypes(pokemon.types.map((e) => e.type.url).toList());

    final entries = Map.fromEntries(
      pokemon.stats.map(
        (e) => MapEntry(
          e.stat.name,
          StatsValueEntity(
            value: e.baseStat,
            minValue:
                e.stat.name == 'hp' ? e.baseStat.minHp : e.baseStat.minStatus,
            maxValue:
                e.stat.name == 'hp' ? e.baseStat.maxHp : e.baseStat.maxStatus,
          ),
        ),
      ),
    );

    // final damages = types.damageFrom;

    final damages = types.damageFrom;

    for (var element in allTypes) {
      if (!damages.containsKey(element)) {
        damages[element] = 0.0;
      }
    }

    return StatsEntity(
      pokemon: pokemon,
      pokemonSpecies: pokemonSpecies,
      statsMap: entries,
      minStat: entries.values.map((e) => e.minValue).maxOrNull ?? 0,
      summation: entries.values.map((e) => e.value).sum,
      damages: damages.entries.map((e) => Pair(e.key, e.value)).toList(),
    );
  }
}
