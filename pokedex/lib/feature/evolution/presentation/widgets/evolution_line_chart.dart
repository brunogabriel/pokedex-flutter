import 'package:flutter/material.dart';
import 'package:pokedex_flutter/feature/evolution/presentation/widgets/pokemon_chart.dart';

class EvolutionLineChart extends StatelessWidget {
  const EvolutionLineChart({
    Key? key,
    required this.firstName,
    required this.firstNumber,
    required this.secondName,
    required this.secondNumber,
    required this.evolutionDescription,
  }) : super(key: key);

  final String firstName;
  final int firstNumber;
  final String secondName;
  final int secondNumber;
  final String evolutionDescription;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PokemonChart(name: firstName, number: firstNumber),
        Column(
          children: [
            Icon(Icons.arrow_forward, color: Colors.grey.withOpacity(0.3)),
            Text(
              evolutionDescription,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        PokemonChart(name: secondName, number: secondNumber),
      ],
    );
  }
}
