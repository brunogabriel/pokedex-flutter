import 'package:flutter/material.dart';

class StatChart extends StatefulWidget {
  const StatChart({
    super.key,
    required this.factor,
    required this.color,
  });

  final double factor;
  final Color color;

  @override
  State<StatChart> createState() => _StatChartState();
}

class _StatChartState extends State<StatChart> {
  var _animated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animated = true;
      });
    });
    // _animate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 8,
          alignment: Alignment.centerLeft,
          child: AnimatedFractionallySizedBox(
            duration: const Duration(milliseconds: 300),
            widthFactor: _animated ? widget.factor : 0.0,
            heightFactor: 1.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: widget.color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
