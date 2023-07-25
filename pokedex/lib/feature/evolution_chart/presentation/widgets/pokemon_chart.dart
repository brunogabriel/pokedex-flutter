import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/extensions/int_extensions.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonChart extends StatelessWidget {
  const PokemonChart({
    Key? key,
    required this.name,
    required this.number,
  }) : super(key: key);

  final String name;
  final int number;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    ...List.generate(10, (index) => (index / 60) * 1.0)
                        .map((e) => Colors.grey.withOpacity(e))
                        .toList()
                  ],
                ).createShader(bounds),
                child: Image.asset(
                  'images/pokeball.png'.asset(),
                  color: Colors.white,
                  // color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: CachedNetworkImage(
                    imageUrl: number.thumbnailUrl,
                  ),
                ),
              ),
            )
          ],
        ),
        Text(number.pokenumber, style: textTheme.bodyMedium),
        Text(
          name,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
