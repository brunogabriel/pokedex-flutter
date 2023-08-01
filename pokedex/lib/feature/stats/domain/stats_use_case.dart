import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/stats/data/stats_repository.dart';
import 'package:pokedex_flutter/feature/stats/domain/entities/stats_entity.dart';
import 'package:pokedex_flutter/feature/stats/domain/entities/stats_value_entity.dart';
import 'package:pokedex_flutter/shared/extensions/int_extensions.dart';

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

    return StatsEntity(
      pokemon: pokemon,
      pokemonSpecies: pokemonSpecies,
      types: types,
      statsMap: entries,
      minStat: entries.values.map((e) => e.minValue).maxOrNull ?? 0,
      summation: entries.values.map((e) => e.value).sum,
    );
  }
}
