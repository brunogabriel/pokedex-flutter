import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../design/constants/pokedex_spacing.dart';
import '../../../../design/constants/pokedex_theme_data.dart';
import '../../../../shared/extensions/pokemon_type_extensions.dart';
import '../constants/evolution_strings.dart';
import '../cubit/evolution_cubit.dart';

class EvolutionEmptyState extends StatelessWidget {
  const EvolutionEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final state = context.watch<EvolutionCubit>().state as NoEvolutionState;

    return Padding(
      padding: const EdgeInsets.only(
        left: PokedexSpacing.kXL,
        right: PokedexSpacing.kXL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            EvolutionStrings.emptyTitle,
            style: textTheme.titleMedium?.copyWith(
              color: state.pokemon.types.first.color.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: PokedexSpacing.kL),
          Text(
            EvolutionStrings.emptyMessage,
            style:
                textTheme.bodyLarge?.copyWith(color: PokedexThemeData.textGrey),
          ),
        ],
      ),
    );
  }
}
