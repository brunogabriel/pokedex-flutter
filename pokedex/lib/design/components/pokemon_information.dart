import 'package:flutter/material.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/shared/data/pokemon.dart';
import 'package:pokedex/shared/extensions/int_extensions.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

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
                pokemon.number.pokenumber,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(
                    0.75,
                  ),
                ),
              ),
              const SizedBox(height: PokedexSpacing.kXS),
              Text(
                pokemon.name,
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
              ...pokemon.types
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                        right: PokedexSpacing.kXS,
                      ),
                      child: BadgeType(type: e.name),
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
