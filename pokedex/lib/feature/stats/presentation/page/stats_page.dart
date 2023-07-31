import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/design/components/error_page.dart';
import 'package:pokedex_flutter/design/components/loading_page.dart';
import 'package:pokedex_flutter/feature/stats/presentation/cubit/stats_cubit.dart';
import 'package:pokedex_flutter/feature/stats/presentation/widgets/stats_success.dart';
import 'package:pokedex_flutter/shared/extensions/pokemon_type_extensions.dart';

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
          } else if (state.runtimeType == StatsFailureState) {
            return ErrorPage(
                assetSize: 120,
                onTap: () => context.read<StatsCubit>().getStats(pokemon));
          }
          return LoadingPage(color: pokemon.types.first.color.primary);
        },
      ),
    );
  }
}
