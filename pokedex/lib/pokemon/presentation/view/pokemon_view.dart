import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedex/shared/design_system/widgets/pokemon_card.dart';

class PokemonView extends StatelessWidget {
  const PokemonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        builder: (context, state) {
          if (state is PokemonError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ops, there's something wrong",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                      onPressed: () =>
                          context.read<PokemonBloc>().add(PokemonRequest()),
                      child: const Text('Try again'))
                ],
              ),
            );
          }
          if (state is PokemonEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ops, there's no data to show here",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            );
          }
          if (state is PokemonResult) {
            return ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (_, index) {
                final pokemon = state.pokemons[index];
                return PokemonCard(
                    name: pokemon.name,
                    number: pokemon.number.toString(),
                    thumbnail: pokemon.thumbnail);
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
