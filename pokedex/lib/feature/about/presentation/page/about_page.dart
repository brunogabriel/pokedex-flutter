import 'package:flutter/material.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/design/constants/pokedex_type_color.dart';
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
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: PokedexSpacing.kXL,
        right: PokedexSpacing.kXL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun\'s rays, seed grows progressively larger.',
            style: textTheme.bodyLarge,
          ),
          SizedBox(
            height: PokedexSpacing.kL,
          ),
          Text(
            'Pokédex Data',
            style: textTheme.titleMedium
                ?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: PokedexSpacing.kL,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Species',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text('Seed Pokémon', style: textTheme.bodyLarge),
                flex: 2,
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Height',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text('0.7m (2′04″)', style: textTheme.bodyLarge),
                flex: 2,
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Base Friendship',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text('70 (normal)', style: textTheme.bodyLarge),
                flex: 2,
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Gender',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: RichText(
                    text: TextSpan(
                        style: textTheme.bodyLarge?.copyWith(
                          color: PokedexTypeColor.flying.primary,
                        ),
                        children: [
                      TextSpan(text: '♀ 87.5% '),
                      TextSpan(
                          text: '♂ 12.5%',
                          style: textTheme.bodyLarge?.copyWith(
                              color: PokedexTypeColor.fairy.primary)),
                    ])),
                flex: 2,
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Weaknesses',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'fire',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'flying',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'ice',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'psychic',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'fire',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'flying',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'ice',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'psychic',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'fire',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'flying',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'ice',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'psychic',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'fire',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'flying',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'ice',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          child: BadgeType.circular(
                            type: 'psychic',
                            diameter: 24,
                            circularPadding: 4,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
                flex: 2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
