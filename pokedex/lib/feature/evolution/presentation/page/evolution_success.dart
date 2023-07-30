import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/feature/evolution/presentation/constants/evolution_strings.dart';
import 'package:pokedex_flutter/feature/evolution/presentation/cubit/evolution_cubit.dart';
import 'package:pokedex_flutter/feature/evolution/presentation/widgets/evolution_chain_chart.dart';
import 'package:pokedex_flutter/shared/data/pair.dart';
import 'package:pokedex_flutter/shared/extensions/list_extensions.dart';
import 'package:pokedex_flutter/shared/extensions/pokemon_type_extensions.dart';
import 'package:pokedex_flutter/shared/extensions/string_extensions.dart';

class EvolutionSuccess extends StatelessWidget {
  const EvolutionSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final evolution =
        (context.watch<EvolutionCubit>().state as EvolutionSuccessState)
            .evolution;

    final evolutions = evolution.evolutions.zipWithNext();

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
                  color: evolution.pokemon.types.first.color.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: PokedexSpacing.kL),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: PokedexSpacing.kXL,
              right: PokedexSpacing.kXL,
            ),
            itemBuilder: (_, index) {
              return _buildEvolutionLineChart(evolutions[index]);
            },
            separatorBuilder: (_, index) =>
                const SizedBox(height: PokedexSpacing.kM),
            itemCount: evolutions.length,
          ),
        ],
      ),
    );
  }

  EvolutionChainChart _buildEvolutionLineChart(
      Pair<ChainLink, ChainLink> nextEvolution) {
    return EvolutionChainChart(
      firstName: nextEvolution.first.species.name.capitalize(),
      firstNumber: nextEvolution.first.species.url.getNumberFromPokemonUrl(),
      secondName: nextEvolution.second.species.name.capitalize(),
      secondNumber: nextEvolution.second.species.url.getNumberFromPokemonUrl(),
      evolutionDescription: _getCause(nextEvolution.first),
    );
  }

  String _getCause(ChainLink evolution) {
    String cause;
    try {
      final evolvesTo = evolution.evolvesTo.first;
      final String trigger;
      if (evolvesTo.evolutionDetails.isNotEmpty) {
        trigger = evolvesTo.evolutionDetails.first.trigger.name;
      } else {
        trigger = '';
      }
      if (trigger == 'level-up') {
        cause = '(Level ${evolvesTo.evolutionDetails.first.minLevel})';
      } else if (trigger == 'use-item') {
        cause =
            '(${evolvesTo.evolutionDetails.first.item?.name.capitalizeKebabCase() ?? ''})';
      } else {
        cause = '';
      }
    } catch (_) {
      cause = '';
    }
    return cause;
  }
}
