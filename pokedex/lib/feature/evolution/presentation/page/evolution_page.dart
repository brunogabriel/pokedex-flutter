import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokedex.dart';

import '../../../../design/components/error_page.dart';
import '../../../../design/components/loading_page.dart';
import '../../../../shared/extensions/pokemon_type_extensions.dart';
import '../cubit/evolution_cubit.dart';
import '../widgets/evolution_empty_state.dart';
import '../widgets/evolution_success.dart';

class EvolutionPage extends StatefulWidget {
  const EvolutionPage({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  State<EvolutionPage> createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<EvolutionCubit>()..requestEvolutionChain(widget.pokemon),
      child: BlocBuilder<EvolutionCubit, EvolutionState>(
        builder: (context, state) {
          if (state.runtimeType == EvolutionSuccessState) {
            return const EvolutionSuccess();
          } else if (state.runtimeType == EvolutionFailureState) {
            return ErrorPage(
              assetSize: 120,
              onTap: () => context.read<EvolutionCubit>()
                ..requestEvolutionChain(widget.pokemon),
            );
          } else if (state.runtimeType == NoEvolutionState) {
            return const EvolutionEmptyState();
          }
          return LoadingPage(color: widget.pokemon.types.first.color.primary);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
