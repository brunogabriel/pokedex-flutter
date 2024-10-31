import 'package:flutter/material.dart';
import '../constants/pokedex_spacing.dart';

class CircularMatrix extends StatelessWidget {
  const CircularMatrix({
    super.key,
    this.rows = 1,
    this.columns = 1,
    this.size = PokedexSpacing.kS,
    this.spaceBetween = PokedexSpacing.kS,
  });

  final int rows;
  final int columns;
  final double size;
  final double spaceBetween;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          ...List.generate(10, (index) => (index / 60) * 1.0)
              .map((e) => Colors.white.withOpacity(e))
        ],
      ).createShader(bounds),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(rows, (columns) => columns).map(
            (e) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(columns, (index) => index).map(
                  (e) => Padding(
                    padding: EdgeInsets.only(
                      right: spaceBetween,
                      bottom: spaceBetween,
                    ),
                    child: Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}