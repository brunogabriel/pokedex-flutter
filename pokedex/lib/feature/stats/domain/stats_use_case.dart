import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

import '../../../shared/data/pair.dart';
import '../../../shared/extensions/int_extensions.dart';
import '../../../shared/extensions/type_extensions.dart';
import 'entities/stats_entity.dart';
import 'entities/stats_value_entity.dart';

abstract class StatsUseCase {
  Future<StatsEntity> getStats(Pokemon pokemon);
}

@Injectable(as: StatsUseCase)
class StatsUseCaseImpl implements StatsUseCase {
  StatsUseCaseImpl(this._pokedex);

  final Pokedex _pokedex;

  @override
  Future<StatsEntity> getStats(Pokemon pokemon) async {
    final pokemonSpecies = await _pokedex.pokemonSpecies.get(id: pokemon.id);
    final typesResources = await _pokedex.types.getAll();
    final allTypes = typesResources.results.map((e) => e.name);
    final types = await Future.wait(pokemon.types
        .map((e) => e.type.url)
        .map((url) => _pokedex.types.getByUrl(url)));
    final damage = types.damageFrom;
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

    damage.addAll(allTypes
        .whereNot((element) => damage.containsKey(element))
        .fold(<String, double>{},
            (previousValue, element) => previousValue..[element] = 1.0));

    return StatsEntity(
      pokemon: pokemon,
      pokemonSpecies: pokemonSpecies,
      statsMap: entries,
      minStat: entries.values.map((e) => e.minValue).maxOrNull ?? 0,
      summation: entries.values.map((e) => e.value).sum,
      multiplers: damage.entries
          .sorted((a, b) => a.value.compareTo(b.value))
          .whereNot((element) => ['unknown', 'shadow'].contains(element.key))
          .map((e) => Pair(e.key, e.value))
          .toList(),
    );
  }
}
