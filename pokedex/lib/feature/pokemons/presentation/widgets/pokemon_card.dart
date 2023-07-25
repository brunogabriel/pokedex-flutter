import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/design/components/circular_matrix.dart';
import 'package:pokedex/design/components/pokemon_information.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/shared/data/pokemon.dart';
import 'package:pokedex/shared/extensions/int_extensions.dart';
import 'package:pokedex/shared/extensions/pokemon_type_extensions.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        context.pushNamed(
          'details',
          extra: pokemon,
        );
      },
      child: SizedBox(
        height: 160,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(PokedexSpacing.kM),
                  color: pokemon.types.first.color.secundary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PokemonInformation(pokemon: pokemon),
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
                    imageUrl: pokemon.number.thumbnailUrl,
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
      ),
    );
  }
}
