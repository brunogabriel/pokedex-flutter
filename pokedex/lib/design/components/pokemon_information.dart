import 'package:flutter/material.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({
    Key? key,
    required this.name,
    required this.number,
    required this.types,
  }) : super(key: key);

  final String name;
  final int number;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(PokedexSpacing.kM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#${number.toString().padLeft(4, '0')}',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(
                    0.75,
                  ),
                ),
              ),
              const SizedBox(height: PokedexSpacing.kXS),
              Text(
                name,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...types
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                        right: PokedexSpacing.kXS,
                      ),
                      child: BadgeType(type: e),
                    ),
                  )
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}
