import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokedex.dart';
import '../../../../design/components/circular_matrix.dart';
import '../../../../design/components/pokemon_information.dart';
import '../../../../design/constants/pokedex_spacing.dart';
import '../../../../shared/extensions/int_extensions.dart';
import '../../../../shared/extensions/pokemon_type_extensions.dart';
import '../../../../shared/extensions/string_extensions.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => context.pushNamed(
        'details',
        pathParameters: {'id': pokemon.id.toString()},
      ),
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 120,
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
                        ],
                      ).createShader(bounds),
                      child: Image.asset(
                        'images/pokeball.png'.asset(),
                        color: Colors.white,
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
                  width: 120,
                  height: 120,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.id.thumbnailUrl,
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
