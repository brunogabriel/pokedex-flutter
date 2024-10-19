import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'bloc/pokemon_list_bloc.dart';
import 'widgets/pokemon_success.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance.get<PokemonListBloc>()
        ..add(
          const PokemonListEventRequest(),
        ),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PokemonListBloc, PokemonListState>(
            builder: (context, state) {
              final pageState = state.pageStatus;
              if (state.firstPage) {
                if (pageState == PageStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (pageState == PageStatus.failure) {
                  return const Text('Error');
                } else if (pageState == PageStatus.initial) {
                  return const SizedBox.shrink();
                }
              }
              return const PokemonSuccess();
            },
          ),
        ),
      ),
    );
  }
}
