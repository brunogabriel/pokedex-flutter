import 'package:flutter/material.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/feature/evolution/presentation/widgets/evolution_line_chart.dart';
import 'package:pokedex/shared/data/pokemon.dart';

class EvolutionPage extends StatelessWidget {
  const EvolutionPage({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: PokedexSpacing.kXL,
          right: PokedexSpacing.kXL,
        ),
        child: Column(
          children: [
            EvolutionLineChart(
              firstName: 'Bulbasaur',
              firstNumber: 1,
              secondName: 'Ivysaur',
              secondNumber: 2,
              evolutionDescription: '(Level 16)',
            ),
            SizedBox(
              height: 32,
            ),
            EvolutionLineChart(
              firstName: 'Ivysaur',
              firstNumber: 2,
              secondName: 'Venusaur',
              secondNumber: 3,
              evolutionDescription: '(Level 32)',
            ),
            SizedBox(
              height: 32,
            ),
            EvolutionLineChart(
              firstName: 'Bulbasaur',
              firstNumber: 1,
              secondName: 'Ivysaur',
              secondNumber: 2,
              evolutionDescription: '(Level 16)',
            ),
            SizedBox(
              height: 32,
            ),
            EvolutionLineChart(
              firstName: 'Ivysaur',
              firstNumber: 2,
              secondName: 'Venusaur',
              secondNumber: 3,
              evolutionDescription: '(Level 32)',
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
