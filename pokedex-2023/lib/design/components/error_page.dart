import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/shared/extensions/string_extensions.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
    required this.onTap,
    this.textColor = Colors.black,
    this.hideAsset = false,
    this.assetSize = 200.0,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Color textColor;
  final bool hideAsset;
  final double assetSize;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final information =
        Random().nextBool() ? _ErrorPage.snorlax() : _ErrorPage.magikarp();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PokedexSpacing.kXL),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!hideAsset) ...{
              SizedBox(
                height: assetSize,
                child: information.asset,
              ),
              const SizedBox(height: PokedexSpacing.kM),
            },
            Text(
              information.title,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: textColor),
            ),
            const SizedBox(height: PokedexSpacing.kS),
            Text(
              information.subtitle,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(color: textColor),
            ),
            const SizedBox(height: PokedexSpacing.kM),
            Container(
              constraints: const BoxConstraints(minWidth: 200),
              child: FilledButton(
                onPressed: onTap,
                child: Text(information.tryAgain),
              ),
            )
          ],
        ),
      ),
    ).animate().fade().scale();
  }
}

class _ErrorPage {
  _ErrorPage({
    required this.title,
    required this.subtitle,
    required this.tryAgain,
    required this.asset,
  });

  factory _ErrorPage.magikarp() => _ErrorPage(
        title: 'Oh no! Magikarp slipped off the hook! 🎣🐟',
        subtitle: 'Better luck next time, Trainer! Use Rod to catch it later.',
        tryAgain: 'Use Rod',
        asset: Image.asset(
          'images/magikarp.png'.asset(),
        ),
      );

  factory _ErrorPage.snorlax() => _ErrorPage(
        title: 'Looks like Snorlax is blocking the way! 💤',
        subtitle: 'Use Poké Flutter to catch it later.',
        tryAgain: 'Use Poké Flutter',
        asset: SvgPicture.asset(
          'images/snorlax_143.svg'.asset(),
        ),
      );

  final String title;
  final String subtitle;
  final String tryAgain;
  final Widget asset;
}
