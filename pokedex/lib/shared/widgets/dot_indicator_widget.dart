import 'package:flutter/material.dart';

class DotIndicatorWidget extends StatelessWidget {
  final bool active;

  const DotIndicatorWidget({
    Key? key,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: active ? 12 : 6,
      width: 6,
      decoration: BoxDecoration(
        color: active ? primaryColor : primaryColor.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
