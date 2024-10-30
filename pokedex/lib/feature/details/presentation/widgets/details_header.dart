import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/design/components/circular_matrix.dart';
import 'package:pokedex_flutter/design/components/pokemon_information.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/shared/extensions/int_extensions.dart';
import 'package:pokedex_flutter/shared/extensions/string_extensions.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: PokedexSpacing.kL, right: PokedexSpacing.kL),
      child: SizedBox(
        height: 120,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          ...List.generate(10, (index) => (index / 10) * 1.0)
                              .map((e) => Colors.white.withOpacity(e))
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
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: PokedexSpacing.kM),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.id.thumbnailUrl,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 120.0,
              ),
              child: PokemonInformation(pokemon: pokemon),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: CircularMatrix(
                rows: 7,
                columns: 3,
              ),
            ),
          ],
        ),
      ),
    ).animate().fade().scale();
  }
}
