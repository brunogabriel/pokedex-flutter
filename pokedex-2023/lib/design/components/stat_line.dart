import 'package:flutter/material.dart';
import 'package:pokedex_flutter/design/components/stat_chart.dart';
import 'package:pokedex_flutter/design/constants/pokedex_theme_data.dart';

class StatLine extends StatelessWidget {
  const StatLine({
    Key? key,
    required this.color,
    required this.title,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.totalValue,
  }) : super(key: key);

  final Color color;
  final String title;
  final int value;
  final int minValue;
  final int maxValue;
  final int totalValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(
            value.toString(),
            style: textTheme.labelLarge
                ?.copyWith(color: PokedexThemeData.textGrey),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 5,
          child: Center(
            child: StatChart(factor: value / totalValue, color: color),
          ),
        ),
        Expanded(
          child: Text(minValue.toString(),
              style: textTheme.labelLarge
                  ?.copyWith(color: PokedexThemeData.textGrey),
              textAlign: TextAlign.right),
        ),
        Expanded(
          child: Text(maxValue.toString(),
              style: textTheme.labelLarge
                  ?.copyWith(color: PokedexThemeData.textGrey),
              textAlign: TextAlign.right),
        ),
      ],
    );
  }
}
