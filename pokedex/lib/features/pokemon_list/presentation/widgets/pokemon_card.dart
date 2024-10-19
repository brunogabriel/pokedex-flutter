import 'package:flutter/material.dart';
import '../../../../design/components/pokemon_information.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: add tap action
      },
      child: SizedBox(
        height: 140.0,
        child: Stack(
          children: [
            PokemonInformation(
              name: name,
            ),
          ],
        ),
      ),
    );
  }
}
