import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_strings.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonsLoadingWidget extends StatelessWidget {
  const PokemonsLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(PokemonsStrings.loading),
        Center(
          child: Lottie.asset(
            'lottie/squirtle_loading.json'.asset(),
            height: 250,
            width: 250,
          ),
        ),
        const SizedBox(height: 24),
        Text(PokemonsStrings.loadingMessage),
      ],
    );
  }
}
