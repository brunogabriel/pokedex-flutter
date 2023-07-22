import 'package:flutter/material.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_strings.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

// TODO: Add click try again action to this screen
class PokemonsErrorWidget extends StatelessWidget {
  const PokemonsErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/sad_pichu.png'.asset(),
            width: 250,
            height: 250,
          ),
          const Text(PokemonsStrings.error),
          const SizedBox(height: 16),
          const Text(PokemonsStrings.errorMessage),
        ],
      ),
    );
  }
}
