import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/design/extensions/design_string_extensions.dart';
import 'package:pokedex_flutter/shared/extensions/string_extensions.dart';

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
      return _buildTextBadge(context);
    }
    return _buildCircular();
  }

  Container _buildTextBadge(BuildContext context) {
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

  Widget _buildCircular() {
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
