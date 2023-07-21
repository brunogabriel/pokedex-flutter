import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/feature/pokemons/presentation/cubit/pokemon_list_cubit.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<PokemonListCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<PokemonListCubit, PokemonListState>(
          builder: (context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}
