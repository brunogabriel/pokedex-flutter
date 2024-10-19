import 'package:flutter/material.dart';
import '../../../../design/components/pokemon_information.dart';
import '../../domain/model/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

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
              name: pokemon.name,
              number: pokemon.number.toString(),
              types: pokemon.types,
            ),
          ],
        ),
      ),
    );
  }
}
