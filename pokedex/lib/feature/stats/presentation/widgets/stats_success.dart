import 'package:flutter/material.dart';
import 'package:pokedex_flutter/design/components/stat_line.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/design/constants/pokedex_type_color.dart';

class StatsSuccess extends StatelessWidget {
  const StatsSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Change Scroll and calcs
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PokedexSpacing.kXL),
      child: Column(
        children: [
          StatLine(
              color: PokedexTypeColor.grass.primary,
              title: 'HP',
              value: 39,
              minValue: calculateMinStat(39),
              maxValue: calculateMaxStat(39)),
          SizedBox(
            height: PokedexSpacing.kM,
          ),
          StatLine(
              color: PokedexTypeColor.grass.primary,
              title: 'Attack',
              value: 52,
              minValue: 98,
              maxValue: 223),
        ],
      ),
    );
  }

  int calculateMinStat(int base) {
    return calculateState(base, 0, 0);
  }

  int calculateMaxStat(int base) {
    return calculateState(base, 252, 31);
  }

  int calculateState(int base, int ev, int iv, [int level = 100]) {
    return ((0.01 * (2 * base + iv + (0.25 * ev)) * level) + level + 10)
        .toInt();
  }
}
