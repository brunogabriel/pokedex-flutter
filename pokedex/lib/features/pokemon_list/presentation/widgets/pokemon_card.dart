import 'package:flutter/material.dart';
import 'package:pokedex/design/widgets/pokemon_information.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: add tap action
      },
      child: const SizedBox(
        height: 140.0,
        child: Stack(
          children: [PokemonInformation()],
        ),
      ),
    );
  }
}
