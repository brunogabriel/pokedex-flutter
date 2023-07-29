import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/design/components/stat_line.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/feature/stats/presentation/cubit/stats_cubit.dart';
import 'package:pokedex_flutter/shared/extensions/int_extensions.dart';
import 'package:pokedex_flutter/shared/extensions/pokemon_type_extensions.dart';

class StatsSuccess extends StatefulWidget {
  const StatsSuccess({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  State<StatsSuccess> createState() => _StatsSuccessState();
}

class _StatsSuccessState extends State<StatsSuccess> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final stats = (context.watch<StatsCubit>().state as StatsSuccessState).data;
    final pokemon = stats.pokemon;
    final primaryColor = pokemon.types.first.color.primary;
    final mapStats = Map.fromEntries(
        pokemon.stats.map((e) => MapEntry(e.stat.name, e.baseStat)));

    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: PokedexSpacing.kXL,
        right: PokedexSpacing.kXL,
      ),
      child: Column(children: [
        _buildStat(mapStats, 'hp', 'HP', primaryColor),
        _buildStat(mapStats, 'attack', 'Attack', primaryColor),
        _buildStat(mapStats, 'defense', 'Attack', primaryColor),
        _buildStat(mapStats, 'special-attack', 'Sp. Atk', primaryColor),
        _buildStat(mapStats, 'special-defense', 'Sp. Def', primaryColor),
        _buildStat(mapStats, 'speed', 'Speed', primaryColor),
      ]),
    );
  }

  Widget _buildStat(
    Map<String, int?> mapStats,
    String key,
    String title,
    Color color,
  ) {
    final stat = mapStats[key] ?? 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: PokedexSpacing.kM),
      child: StatLine(
        color: color,
        title: title,
        value: stat,
        minValue: key == 'hp' ? stat.minHp : stat.minStatus,
        maxValue: key == 'hp' ? stat.maxHp : stat.maxStatus,
      ),
    );
  }
}
