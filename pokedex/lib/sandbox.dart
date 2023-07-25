import 'package:flutter/material.dart';
import 'package:pokedex/refact/pokemon_card.dart';
import 'package:pokedex/refact/pokemon_vo.dart';

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: PokemonCard(
              vo: PokemonVO(
                name: 'Bulbasaur',
                number: 1,
                types: ['grass', 'poison'],
                thumbnailImage:
                    'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/thumbnails/001.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: PokemonCard(
              vo: PokemonVO(
                name: 'Charmander',
                number: 4,
                types: ['fire'],
                thumbnailImage:
                    'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/thumbnails/004.png',
              ),
            ),
          ),
        ],
      )),
    );
  }
}
