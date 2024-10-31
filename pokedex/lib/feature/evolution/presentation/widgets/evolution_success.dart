import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../design/constants/pokedex_spacing.dart';
import '../../../../shared/extensions/pokemon_type_extensions.dart';
import '../../domain/entity/evolution_entity.dart';
import '../constants/evolution_strings.dart';
import '../cubit/evolution_cubit.dart';
import 'evolution_chain_chart.dart';

class EvolutionSuccess extends StatelessWidget {
  const EvolutionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final evolutionEntity =
        (context.watch<EvolutionCubit>().state as EvolutionSuccessState)
            .evolution;

    final evolutions = evolutionEntity.evolutions;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: PokedexSpacing.kXL,
        right: PokedexSpacing.kXL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            EvolutionStrings.evolutionChart,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: evolutionEntity.pokemon.types.first.color.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: PokedexSpacing.kL),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return _buildEvolutionLineChart(evolutions[index]);
            },
            separatorBuilder: (_, index) =>
                const SizedBox(height: PokedexSpacing.kXL),
            itemCount: evolutions.length,
          ),
          const SizedBox(height: PokedexSpacing.kXXL)
        ],
      ),
    );
  }

  EvolutionChainChart _buildEvolutionLineChart(
      EvolutionDescriptionEntity evolution) {
    return EvolutionChainChart(
      firstName: evolution.from,
      firstNumber: evolution.fromNumber,
      secondName: evolution.to,
      secondNumber: evolution.toNumber,
      evolutionDescription: evolution.cause,
      sprites: evolution.sprites,
      details: evolution.details,
    );
  }
}
