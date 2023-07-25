import 'package:flutter/material.dart';
import 'package:pokedex/design/constants/pokedex_type_color.dart';
import 'package:pokedex/feature/details/presentation/page/details_pokemon.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: PokedexTypeColor.fire.secundary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // TODO change leading
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            DetailsPokemon(),
          ],
        ),
      ),
    );
  }
}
