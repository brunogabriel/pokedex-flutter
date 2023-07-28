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
  final double value;
  final double minValue;
  final double maxValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title),
        ),
        Expanded(
            child: Text(
          value.toString(),
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
          textAlign: TextAlign.right,
        )),
        Expanded(
            child: Text(
          maxValue.toString(),
          textAlign: TextAlign.right,
        )),
      ],
    );
  }
}
