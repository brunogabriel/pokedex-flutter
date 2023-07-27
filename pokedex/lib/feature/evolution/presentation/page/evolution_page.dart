import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/feature/evolution/presentation/widgets/evolution_line_chart.dart';

class EvolutionPage extends StatefulWidget {
  const EvolutionPage({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  State<EvolutionPage> createState() => _EvolutionPageState();
}

class _EvolutionPageState extends State<EvolutionPage>
    with AutomaticKeepAliveClientMixin {
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

  @override
  bool get wantKeepAlive => true;
}
