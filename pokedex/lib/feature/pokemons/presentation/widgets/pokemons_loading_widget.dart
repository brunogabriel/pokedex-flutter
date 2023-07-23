import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/design/pokedex_spacing.dart';
import 'package:pokedex/feature/pokemons/presentation/widgets/pokemons_strings.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonsLoadingWidget extends StatelessWidget {
  const PokemonsLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PokedexSpacing.kL),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Lottie.asset(
              'lottie/squirtle_loading.json'.asset(),
              height: 200,
              width: 200,
            ),
          ).animate().fade(),
          const SizedBox(height: PokedexSpacing.kM),
          Text(PokemonsStrings.loading,
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold))
              .animate()
              .fade()
              .scale(),
          const SizedBox(height: PokedexSpacing.kXS),
          Text(PokemonsStrings.loadingMessage, style: textTheme.bodyMedium)
              .animate()
              .fade()
              .scale(),
          const SizedBox(height: PokedexSpacing.kM),
          SizedBox(
              width: 200,
              child: LinearProgressIndicator(color: colorTheme.onSecondary))
        ],
      ),
    );
  }
}
