import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class EvolutionMethodChart extends StatelessWidget {
  const EvolutionMethodChart({
    Key? key,
    required this.title,
    this.subtitle,
    required this.sprites,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final List<String> sprites;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(
          height: 32,
          child: Row(
            children: [
              ...sprites
                  .mapIndexed(
                    (index, element) => Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: element,
                          width: 32,
                          height: 32,
                          errorWidget: (_, __, ___) => const SizedBox(
                            width: 32,
                            height: 32,
                          ),
                        ),
                        if (index < sprites.length - 1) ...{
                          Text(
                            '+',
                            style: textTheme.titleSmall,
                          )
                        }
                      ],
                    ),
                  )
                  .toList()
            ],
          ),
        ),

        // ).toList(),
        Icon(Icons.arrow_forward, color: Colors.grey.withOpacity(0.5)),
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
