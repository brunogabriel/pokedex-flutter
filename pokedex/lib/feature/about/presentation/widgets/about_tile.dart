import 'package:flutter/material.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/design/constants/pokedex_theme_data.dart';

class AboutTile extends StatelessWidget {
  const AboutTile({
    super.key,
    required this.title,
    required this.content,
    this.items,
    this.custom,
    this.subcontent,
  });

  const AboutTile.list({
    super.key,
    required this.title,
    required this.items,
    this.content,
    this.custom,
    this.subcontent,
  });

  const AboutTile.weaknesses({
    super.key,
    required this.title,
    this.content,
    this.items,
    this.custom,
    this.subcontent,
  });

  const AboutTile.custom({
    super.key,
    required this.title,
    required this.custom,
    this.content,
    this.items,
    this.subcontent,
  });

  final String title;
  final String? content;
  final String? subcontent;
  final List<AboutTileItem>? items;
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(content ?? '',
                    style: textTheme.bodyLarge
                        ?.copyWith(color: PokedexThemeData.textGrey)),
                if (subcontent != null) ...{
                  const SizedBox(width: PokedexSpacing.kXS),
                  Text(subcontent ?? '',
                      style: textTheme.bodySmall
                          ?.copyWith(color: PokedexThemeData.textGrey)),
                }
              ],
            ),
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
                              ?.copyWith(color: PokedexThemeData.textGrey)
                          : textTheme.bodySmall
                              ?.copyWith(color: PokedexThemeData.textGrey),
                    )),
              ],
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
