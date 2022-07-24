import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokemon/presentation/view/pokemon_view.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => PokemonBloc(GetIt.I.get()),
        child: const PokemonView(),
      );
}
