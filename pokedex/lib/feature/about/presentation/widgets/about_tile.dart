import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';

// TODO: This component need to be refactored
class AboutTile extends StatelessWidget {
  const AboutTile({
    super.key,
    required this.title,
    required this.content,
    this.items,
    this.weaknesses,
    this.custom,
  });

  const AboutTile.list({
    super.key,
    required this.title,
    required this.items,
    this.content,
    this.weaknesses,
    this.custom,
  });

  const AboutTile.weaknesses({
    super.key,
    required this.title,
    required this.weaknesses,
    this.content,
    this.items,
    this.custom,
  });

  const AboutTile.custom({
    super.key,
    required this.title,
    required this.custom,
    this.content,
    this.weaknesses,
    this.items,
  });

  final String title;
  final String? content;
  final List<AboutTileItem>? items;
  final List<String>? weaknesses;
  final Widget? custom;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        if (content != null) ...{
          Expanded(
            flex: 2,
            child: Text(content ?? '', style: textTheme.bodyLarge),
          )
        } else if (items != null) ...{
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...(items ?? []).map((item) => Text(
                      item.content,
                      style: item.small
                          ? textTheme.bodyLarge
                          : textTheme.bodySmall,
                    )),
              ],
            ),
          )
        } else if (weaknesses != null) ...{
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final slices =
                    (weaknesses ?? []).slices(constraints.maxWidth ~/ 28);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...slices
                        .map(
                          (types) => Padding(
                            padding: const EdgeInsets.only(
                                bottom: PokedexSpacing.kXS),
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
                                        diameterPadding: 4),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList()
                  ],
                );
              },
            ),
          )
        } else if (custom != null) ...{
          Expanded(
            flex: 2,
            child: custom ?? const SizedBox.shrink(),
          )
        }
      ],
    );
  }
}

class AboutTileItem {
  AboutTileItem({
    required this.content,
    this.small = false,
  });

  final String content;
  final bool small;
}
