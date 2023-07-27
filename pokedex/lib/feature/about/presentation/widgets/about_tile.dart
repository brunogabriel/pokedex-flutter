import 'package:flutter/material.dart';

enum AboutTileType { text, textList, custom }

// TODO: improvements in constructors with required values

class AboutTile extends StatelessWidget {
  const AboutTile({
    super.key,
    required this.title,
    this.type = AboutTileType.text,
    this.content = '',
    this.contents = const <String>[],
    this.custom = const SizedBox.shrink(),
  });

  const AboutTile.textList({
    super.key,
    this.type = AboutTileType.textList,
    this.title = '',
    this.content = '',
    this.contents = const <String>[],
    this.custom = const SizedBox.shrink(),
  });

  const AboutTile.custom({
    super.key,
    this.type = AboutTileType.textList,
    this.title = '',
    this.content = '',
    this.contents = const <String>[],
    this.custom = const SizedBox.shrink(),
  });

  final AboutTileType type;
  final String title; // TODO: required always
  final String content;
  final List<String> contents;
  final Widget custom;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (type == AboutTileType.textList) {
      return _buildTextList(textTheme);
    } else if (type == AboutTileType.custom) {}

    return _buildText(textTheme);
  }

  Widget _buidWidget(TextTheme textTheme, Widget contentWidget) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_lineTitle(textTheme), contentWidget],
    );
  }

  Widget _lineTitle(TextTheme textTheme) {
    return Expanded(
      child: Text(
        title,
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextList(TextTheme textTheme) {
    return Row(
      children: [
        _lineTitle(textTheme),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...contents
                  .map(
                    (e) => Text(e, style: textTheme.bodyLarge),
                  )
                  .toList()
            ],
          ),
        )
      ],
    );
  }

  Widget _buildText(TextTheme textTheme) {
    return Row(
      children: [
        _lineTitle(textTheme),
        Expanded(
          flex: 2,
          child: Text(content, style: textTheme.bodyLarge),
        )
      ],
    );
  }
}
