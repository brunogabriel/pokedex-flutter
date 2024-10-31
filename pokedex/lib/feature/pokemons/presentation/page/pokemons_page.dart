import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../design/components/error_page.dart';
import '../../../../design/components/loading_page.dart';
import '../bloc/pokemons_bloc.dart';
import '../widgets/pokemons_success.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (providerContext) =>
          GetIt.I.get<PokemonsBloc>()..add(const PokemonsRequestEvent()),
      child: Scaffold(
        body: SafeArea(
            child: BlocBuilder<PokemonsBloc, PokemonsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            final status = state.status;
            if (state.firstPage) {
              if (status == Status.loading) {
                return const LoadingPage();
              } else if (status == Status.failure) {
                return ErrorPage(
                    onTap: () => context.read<PokemonsBloc>()
                      ..add(const PokemonsRequestEvent()));
              } else if (status == Status.initial) {
                return const SizedBox.shrink();
              }
            }
            return const PokemonsSuccess();
          },
        )),
      ),
    );
  }
}
