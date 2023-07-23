import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/feature/pokemons/presentation/bloc/pokemons_list_bloc.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_widget.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            GetIt.I.get<PokemonsListBloc>()..add(PokemonsListRequestEvent()),
        child: const PokemonsWidget(),
      );
}
