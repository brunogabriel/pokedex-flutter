import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/feature/about/presentation/cubit/about_cubit.dart';
import 'package:pokedex/feature/about/presentation/widgets/about_failure.dart';
import 'package:pokedex/feature/about/presentation/widgets/about_loading.dart';
import 'package:pokedex/feature/about/presentation/widgets/about_success.dart';
import 'package:pokedex/shared/data/pokemon.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<AboutCubit>()..requestData(pokemon.number),
      child: BlocBuilder<AboutCubit, AboutState>(
        builder: (context, state) {
          if (state.runtimeType == AboutSuccessState) {
            return AboutSuccess(pokemon: pokemon);
          } else if (state.runtimeType == AboutFailureState) {
            return const AboutFailure();
          }
          return const AboutLoading();
        },
      ),
    );
  }
}
