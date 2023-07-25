import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/components/circular_matrix.dart';
import 'package:pokedex/design/components/pokemon_information.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/design/extensions/design_string_extensions.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.name,
    required this.number,
    required this.types,
    required this.thumbnailUrl,
  }) : super(key: key);

  final String name;
  final int number;
  final List<String> types;
  final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // TODO: verify click effect
    return InkWell(
      onTap: () {
        context.pushNamed('details');
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
                  color: types.first.pokemonColor.secundary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PokemonInformation(
                      name: name,
                      number: number,
                      types: types,
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
                    imageUrl: thumbnailUrl,
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
