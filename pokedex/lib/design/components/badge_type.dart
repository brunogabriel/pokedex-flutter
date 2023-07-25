import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class BadgeType extends StatelessWidget {
  const BadgeType({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(
          PokedexSpacing.kM,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: PokedexSpacing.kXS,
          horizontal: PokedexSpacing.kS,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset(
                    'icons/$type.svg'.asset(),
                  ),
                ),
              ),
            ),
            Text(
              type.capitalize(),
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
