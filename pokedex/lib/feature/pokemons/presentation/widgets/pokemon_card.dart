import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/pokedex_spacing.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.name,
    required this.number,
    required this.thumbnailUrl,
    required this.types,
  }) : super(key: key);

  final String name;
  final String number;
  final String thumbnailUrl;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(PokedexSpacing.kS),
        color: (types.isEmpty ? '' : types[0]).pokemonColor(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(PokedexSpacing.kM),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nº $number',
                      style:
                          textTheme.bodyMedium?.copyWith(color: Colors.white)),
                  const SizedBox(height: PokedexSpacing.kS),
                  Text(
                    name,
                    style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: PokedexSpacing.kS),
                  Row(
                    children: [
                      ...types
                          .map(
                            (type) => Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: BadgeType(type: type)),
                          )
                          .toList(),
                    ],
                  ),
                ],
              ),
            ),
            CachedNetworkImage(
              width: 100,
              height: 100,
              imageUrl: thumbnailUrl,
            ),
          ],
        ),
      ),
    );
  }
}
