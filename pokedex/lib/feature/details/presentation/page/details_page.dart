import 'package:flutter/material.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/feature/details/presentation/page/details_pokemon.dart';
import 'package:pokedex/shared/data/pokemon.dart';
import 'package:pokedex/shared/extensions/pokemon_type_extensions.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemon.types.first.color.secundary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            DetailsPokemon(
              pokemon: pokemon,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(PokedexSpacing.kL),
                    topRight: Radius.circular(PokedexSpacing.kL),
                  ),
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
