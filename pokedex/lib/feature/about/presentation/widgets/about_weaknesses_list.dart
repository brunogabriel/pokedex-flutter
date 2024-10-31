import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../../../../design/components/badge_type.dart';
import '../../../../design/constants/pokedex_spacing.dart';

class AboutWeaknessesList extends StatelessWidget {
  const AboutWeaknessesList({super.key, required this.weaknesses});

  final List<String>? weaknesses;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final slices = (weaknesses ?? []).slices(constraints.maxWidth ~/ 28);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...slices.map(
              (types) => Padding(
                padding: const EdgeInsets.only(bottom: PokedexSpacing.kXS),
                child: Row(
                  children: [
                    ...types.map(
                      (type) => Padding(
                        padding: const EdgeInsets.only(
                          right: PokedexSpacing.kXS,
                        ),
                        child: BadgeType.circular(
                          type: type,
                          diameter: 24,
                          diameterPadding: 4,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
