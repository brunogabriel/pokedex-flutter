import 'package:flutter/material.dart';
import 'package:pokedex_flutter/design/components/stat_chart.dart';

class StatLine extends StatelessWidget {
  const StatLine({
    Key? key,
    required this.color,
    required this.title,
    required this.value,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);

  final Color color;
  final String title;
  final int value;
  final int minValue;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: Text(
          value.toString(),
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        )),
        Expanded(
          flex: 5,
          child: Center(
            child: StatChart(
              factor: value / minValue,
              color: color,
            ),
          ),
        ),
        Expanded(
            child: Text(
          minValue.toString(),
          style: textTheme.bodyLarge,
          textAlign: TextAlign.right,
        )),
        Expanded(
            child: Text(
          maxValue.toString(),
          style: textTheme.bodyLarge,
          textAlign: TextAlign.right,
        )),
      ],
    );
  }
}
