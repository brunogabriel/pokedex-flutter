import 'package:flutter/material.dart';
import 'package:pokedex/refact/pokemon_card.dart';

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: PokemonCard(),
          ),
        ],
      )),
    );
  }
}
