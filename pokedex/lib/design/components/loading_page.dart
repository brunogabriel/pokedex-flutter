import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pokedex_flutter/shared/extensions/string_extensions.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    Key? key,
    this.color = Colors.black,
  }) : super(key: key);

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
