import 'package:flutter/material.dart';
import 'package:pokedex/design/pokedex_spacing.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key? key,
    required this.name,
    required this.number,
    required this.types,
  }) : super(key: key);

  final String name;
  final String number;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(PokedexSpacing.kS),
      decoration: BoxDecoration(
          color: (types.isEmpty ? '' : types[0]).pokemonColor(),
          borderRadius: BorderRadius.circular(PokedexSpacing.kS)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                number,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
