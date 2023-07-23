import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/feature/pokemons/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_error_widget.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_loading_widget.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<PokemonListCubit>()..requestPokemons(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<PokemonListCubit, PokemonListState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            final status = state.status;

            if (state.firstPage) {
              if (status == Status.loading) {
                return const Center(child: PokemonsLoadingWidget());
              } else if (status == Status.failure) {
                return const Center(child: PokemonsErrorWidget());
              } else if (status == Status.initial) {
                return const SizedBox.shrink();
              }
            }

            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => const Text('Pokédex'),
                    childCount: 1,
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 10.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Text('Pokémon: ${state.result[index].name}');
                    },
                    childCount: state.result.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
