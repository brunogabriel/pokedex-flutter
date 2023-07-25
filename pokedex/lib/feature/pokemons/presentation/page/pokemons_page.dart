import 'package:flutter/material.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/feature/pokemons/presentation/constants/pokemons_strings.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          scrolledUnderElevation: 0,
          floating: true,
          expandedHeight: 120.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding:
                const EdgeInsets.symmetric(horizontal: PokedexSpacing.kL),
            title: Text(
              PokemonStrings.title,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PokedexSpacing.kL,
              vertical: PokedexSpacing.kS,
            ),
            child: Text(
              PokemonStrings.subtitle,
              style: textTheme.bodyMedium,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(
                  child: Text('$index', textScaleFactor: 5),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    ));
  }
}
