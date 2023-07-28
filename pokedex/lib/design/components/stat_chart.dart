import 'package:flutter/material.dart';

class StatChart extends StatelessWidget {
  const StatChart({
    Key? key,
    required this.factor,
    required this.color,
  }) : super(key: key);

  final double factor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 4,
          alignment: Alignment.centerLeft,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.transparent,
          ),
          child: FractionallySizedBox(
            widthFactor: factor,
            heightFactor: 1.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: color,
              ),
            ),
          ),
        )
      ],
    );
  }
}
