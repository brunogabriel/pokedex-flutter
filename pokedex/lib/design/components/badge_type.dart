import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/extensions/string_extensions.dart';
import '../constants/pokedex_spacing.dart';
import '../extensions/design_string_extensions.dart';

class BadgeType extends StatelessWidget {
  const BadgeType({
    super.key,
    required this.type,
    this.diameter = 0.0,
    this.diameterPadding = 0.0,
  });

  const BadgeType.circular({
    super.key,
    required this.type,
    required this.diameter,
    required this.diameterPadding,
  });

  final String type;
  final double diameter;
  final double diameterPadding;

  @override
  Widget build(BuildContext context) {
    if (diameter == 0.0) {
      final textTheme = Theme.of(context).textTheme;

      return Container(
        decoration: BoxDecoration(
          color: type.pokemonColor.primary,
          borderRadius: BorderRadius.circular(PokedexSpacing.kM),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PokedexSpacing.kS,
            vertical: PokedexSpacing.kXS,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: PokedexSpacing.kM,
                width: PokedexSpacing.kM,
                child: SvgPicture.asset('icons/$type.svg'.asset()),
              ),
              const SizedBox(
                width: PokedexSpacing.kS,
              ),
              Text(
                type.capitalize(),
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    }

    return _CircularBadge(
      type: type,
      diameter: diameter,
      diameterPadding: diameterPadding,
    );
  }
}

class _CircularBadge extends StatelessWidget {
  const _CircularBadge({
    required this.type,
    required this.diameter,
    required this.diameterPadding,
  });

  final String type;
  final double diameter;
  final double diameterPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: diameter,
      width: diameter,
      decoration: BoxDecoration(
        color: type.pokemonColor.primary,
        borderRadius: BorderRadius.circular(diameter),
      ),
      child: Padding(
        padding: EdgeInsets.all(diameterPadding),
        child: SizedBox(
          child: SvgPicture.asset('icons/$type.svg'.asset()),
        ),
      ),
    );
  }
}
