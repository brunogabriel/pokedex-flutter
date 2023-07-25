import 'package:flutter/material.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/constants/pokedex_type_color.dart';

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          ...PokedexTypeColor.values
              .map((e) => e.name)
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: BadgeType(type: e),
                  ))
              .toList(),
          ...PokedexTypeColor.values
              .map((e) => e.name)
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: BadgeType.circular(type: e),
                  ))
              .toList(),
        ],
      )),
    );
  }
}
