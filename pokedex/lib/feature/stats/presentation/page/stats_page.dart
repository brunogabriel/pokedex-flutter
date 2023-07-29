import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/stats/presentation/cubit/stats_cubit.dart';
import 'package:pokedex_flutter/feature/stats/presentation/widgets/stats_success.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<StatsCubit>()..getStats(pokemon),
      child: BlocBuilder<StatsCubit, StatsState>(
        builder: (context, state) {
          if (state.runtimeType == StatsSuccessState) {
            return StatsSuccess(
              pokemon: pokemon,
            );
          }
          // TODO: add another ones
          return SizedBox.shrink();
        },
      ),
    );
  }
}
