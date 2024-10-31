import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../shared/extensions/string_extensions.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
    this.color = Colors.black,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 64,
        height: 64,
        child: Image.asset(
          'images/pokeball.png'.asset(),
          color: color,
        ),
      ),
    )
        .animate()
        .fade()
        .scale()
        .then()
        .animate(
          onPlay: (controller) => controller.repeat(),
        )
        .rotate(duration: const Duration(seconds: 1))
        .then();
  }
}
