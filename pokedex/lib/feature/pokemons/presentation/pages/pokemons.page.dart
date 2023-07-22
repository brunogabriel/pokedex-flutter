import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/feature/pokemons/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_error_widget.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_loading_widget.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<PokemonListCubit>()..requestPokemons(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<PokemonListCubit, PokemonListState>(
          builder: (context, state) {
            return const PokemonsLoadingWidget();
            // final status = state.status;
            // if (status == Status.loading && state.firstPage) {
            //   //  TODO real loading
            //   return const Center(
            //     child: SizedBox(
            //       width: 65,
            //       height: 64,
            //       child: CircularProgressIndicator(),
            //     ),
            //   );
            // } else if (status == Status.failure && state.firstPage) {
            //   return const PokemonsErrorWidget();
            // }

            // return CustomScrollView(
            //   slivers: [
            //     SliverList(
            //       delegate: SliverChildBuilderDelegate(
            //         (context, index) => const Text('Pokédex'),
            //         childCount: 1,
            //       ),
            //     ),
            //     SliverGrid(
            //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: 5.0,
            //         crossAxisSpacing: 10.0,
            //       ),
            //       delegate: SliverChildBuilderDelegate(
            //         (BuildContext context, int index) {
            //           return Text('Pokémon: ${state.result[index].name}');
            //         },
            //         childCount: state.result.length,
            //       ),
            //     ),
            //   ],
            // );
          },
        ),
      ),
    );
  }
}
