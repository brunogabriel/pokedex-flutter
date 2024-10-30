import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/design/components/badge_type.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/design/constants/pokedex_theme_data.dart';
import 'package:pokedex_flutter/shared/data/pair.dart';
import 'package:pokedex_flutter/shared/extensions/double_extensions.dart';

class StatsTypesList extends StatelessWidget {
  const StatsTypesList({
    super.key,
    required this.defenses,
  });

  final List<Pair<String, double>> defenses;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .bodyLarge
        ?.copyWith(color: PokedexThemeData.textGrey);
    return LayoutBuilder(
      builder: (context, constraints) {
        final slices = (defenses).slices(constraints.maxWidth ~/ 46);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...slices
                .map(
                  (types) => Padding(
                    padding: const EdgeInsets.only(bottom: PokedexSpacing.kM),
                    child: Row(
                      children: [
                        ...types.map(
                          (type) => Padding(
                            padding: const EdgeInsets.only(
                              right: PokedexSpacing.kS,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BadgeType.circular(
                                  type: type.first,
                                  diameter: 34,
                                  diameterPadding: 6,
                                ),
                                Text(
                                  type.second.toEffectivenessFactor(),
                                  style: textTheme,
                                ),
                              ],
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
