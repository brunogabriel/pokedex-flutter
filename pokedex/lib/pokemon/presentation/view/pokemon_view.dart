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
          if (state is PokemonInitial) {
            context.read<PokemonBloc>().add(PokemonRequest());
          }

          if (state is PokemonResult) {
            return ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (_, index) {
                final pokemon = state.pokemons[index];
                return PokemonCard(
                    name: pokemon.name,
                    number: pokemon.number
                        .toString(), // TODO: converter para o modelo de UI com 001
                    thumbnail: pokemon.thumbnail);
              },
            );
          }
          return _buildLoading();
        });
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
