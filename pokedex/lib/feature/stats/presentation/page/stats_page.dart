import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokedex.dart';

import '../../../../design/components/error_page.dart';
import '../../../../design/components/loading_page.dart';
import '../../../../shared/extensions/pokemon_type_extensions.dart';
import '../cubit/stats_cubit.dart';
import '../widgets/stats_success.dart';

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
