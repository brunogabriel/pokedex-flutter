import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final colorTheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(PokedexSpacing.kS),
      decoration: BoxDecoration(
        color: (types.isEmpty ? '' : types[0]).pokemonColor(),
        borderRadius: BorderRadius.circular(PokedexSpacing.kS),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorTheme.onSecondary,
                  ),
                ),
              ),
              Text(
                number,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorTheme.onSecondary,
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: CachedNetworkImage(
                imageUrl: thumbnailUrl,
                width: 120,
                height: 120,
              ),
            ),
          ),
          Row(
            children: [
              ...types
                  .map(
                    (type) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorTheme.onPrimary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(
                            PokedexSpacing.kM,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(PokedexSpacing.kS),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                                height: 10,
                                child: SvgPicture.asset(
                                  'icons/$type.svg'.asset(),
                                  colorFilter: ColorFilter.mode(
                                    colorTheme.onSecondary,
                                    BlendMode.modulate,
                                  ),
                                ),
                              ),
                              const SizedBox(width: PokedexSpacing.kS),
                              Text(
                                type.capitalize(),
                                textAlign: TextAlign.center,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorTheme.onSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}
