import 'package:flutter/material.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/shared/data/pokemon.dart';
import 'package:pokedex/shared/extensions/pokemon_type_extensions.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = pokemon.types.first.color.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pokédex Data',
          style: textTheme.bodyLarge?.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: PokedexSpacing.kM),
        Row(
          children: [
            Text(
              'Species',
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Seed Pokémon', style: textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: PokedexSpacing.kM),
        Row(
          children: [
            Text(
              'Species',
              style: textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Seed Pokémon', style: textTheme.bodyMedium),
          ],
        )
      ],
    );
  }
}
