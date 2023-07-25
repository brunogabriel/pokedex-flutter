import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/components/circular_matrix.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/design/extensions/design_string_extensions.dart';
import 'package:pokedex/refact/pokemon_vo.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.vo,
  }) : super(key: key);

  final PokemonVO vo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(PokedexSpacing.kM),
                color: vo.types.first.pokemonColor.secundary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(PokedexSpacing.kM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '#${vo.number.toString().padLeft(4, '0')}',
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(
                                  0.75,
                                ),
                              ),
                            ),
                            const SizedBox(height: PokedexSpacing.kXS),
                            Text(
                              vo.name,
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
                            ...vo.types
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
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        ...List.generate(10, (index) => (index / 10) * 1.0)
                            .map((e) => Colors.white.withOpacity(e))
                            .toList()
                      ],
                    ).createShader(bounds),
                    child: Image.asset(
                      'images/pokeball.png'.asset(),
                      color: Colors.white,
                      // color: Colors.white.withOpacity(0.1),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: PokedexSpacing.kM),
              child: SizedBox(
                width: 140,
                height: 140,
                child: CachedNetworkImage(
                  imageUrl: vo.thumbnailImage,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 100, top: 24),
            child: CircularMatrix(
              rows: 3,
              columns: 6,
            ),
          ),
        ],
      ),
    );
  }
}
