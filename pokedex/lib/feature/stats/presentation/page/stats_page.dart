import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/design/components/error_page.dart';
import 'package:pokedex_flutter/design/components/loading_page.dart';
import 'package:pokedex_flutter/feature/stats/presentation/cubit/stats_cubit.dart';
import 'package:pokedex_flutter/feature/stats/presentation/widgets/stats_success.dart';
import 'package:pokedex_flutter/shared/extensions/pokemon_type_extensions.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => GetIt.I.get<StatsCubit>()..getStats(widget.pokemon),
      child: BlocBuilder<StatsCubit, StatsState>(
        builder: (context, state) {
          if (state.runtimeType == StatsSuccessState) {
            return StatsSuccess(
              pokemon: widget.pokemon,
            );
          } else if (state.runtimeType == StatsFailureState) {
            return ErrorPage(
                assetSize: 120,
                onTap: () =>
                    context.read<StatsCubit>().getStats(widget.pokemon));
          }
          return LoadingPage(color: widget.pokemon.types.first.color.primary);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
