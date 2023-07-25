import 'package:flutter/material.dart';
import 'package:pokedex/feature/evolution_chart/presentation/widgets/evolution_line_chart.dart';

class EvolutionChartPage extends StatelessWidget {
  const EvolutionChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
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
          ],
        ),
      ),
    );
  }
}
