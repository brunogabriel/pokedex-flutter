import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/design/extensions/design_string_extensions.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class BadgeType extends StatelessWidget {
  const BadgeType({
    Key? key,
    required this.type,
    this.circular = false,
  }) : super(key: key);

  const BadgeType.circular({
    super.key,
    required this.type,
    this.circular = true,
  });

  final String type;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    if (circular) {
      return _buildCircular();
    }
    return _buildWidget(context);
  }

  Widget _buildWidget(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: type.pokemonColor(),
        borderRadius: BorderRadius.circular(16),
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
              height: 16,
              width: 16,
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
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: type.pokemonColor(),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          child: SvgPicture.asset('icons/$type.svg'.asset()),
        ),
      ),
    );
  }
}
