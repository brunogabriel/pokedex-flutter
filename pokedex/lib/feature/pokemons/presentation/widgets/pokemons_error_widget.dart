import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pokedex/design/pokedex_spacing.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_strings.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonsErrorWidget extends StatelessWidget {
  const PokemonsErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/sad_pichu.png'.asset(),
            width: 250,
            height: 250,
          ).animate().fade(),
          const SizedBox(height: PokedexSpacing.kM),
          Text(PokemonsStrings.error,
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold))
              .animate()
              .fade()
              .scale(),
          const SizedBox(height: PokedexSpacing.kM),
          Text(
            PokemonsStrings.errorMessage,
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ).animate().fade().scale(),
          const SizedBox(height: PokedexSpacing.kM),
          FilledButton(onPressed: () {}, child: Text('Give another shot'))
        ],
      ),
    );
  }
}
