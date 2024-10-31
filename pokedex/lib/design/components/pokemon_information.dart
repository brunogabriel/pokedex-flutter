import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';

import '../../shared/extensions/int_extensions.dart';
import '../../shared/extensions/string_extensions.dart';
import '../constants/pokedex_spacing.dart';
import 'badge_type.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({
    super.key,
    required this.pokemon,
  });

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
                pokemon.id.pokenumber,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.75),
                ),
              ),
              const SizedBox(height: PokedexSpacing.kXS),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  pokemon.name.capitalizeName(),
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...pokemon.types.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(
                    right: PokedexSpacing.kXS,
                  ),
                  child: BadgeType(type: e.type.name),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
