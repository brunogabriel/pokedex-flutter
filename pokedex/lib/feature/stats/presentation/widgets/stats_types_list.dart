import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/design/components/badge_type.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/shared/data/pair.dart';

class StatsTypesList extends StatelessWidget {
  const StatsTypesList({
    Key? key,
    required this.defenses,
  }) : super(key: key);

  final List<Pair<String, double>> defenses;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final slices = (defenses).slices(constraints.maxWidth ~/ 28);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...slices
              .map(
                (types) => Padding(
                  padding: const EdgeInsets.only(bottom: PokedexSpacing.kXS),
                  child: Row(
                    children: [
                      ...types.map(
                        (type) => Padding(
                          padding: const EdgeInsets.only(
                            right: PokedexSpacing.kXS,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BadgeType.circular(
                                type: type.first,
                                diameter: 24,
                                diameterPadding: 4,
                              ),
                              Text(type.second.toString()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList()
        ],
      );
    });
  }
}
