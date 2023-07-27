import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/feature/about/data/models/about.dart';
import 'package:pokedex/feature/about/presentation/cubit/about_cubit.dart';
import 'package:pokedex/feature/about/presentation/widgets/about_strings.dart';
import 'package:pokedex/feature/about/presentation/widgets/about_tile.dart';
import 'package:pokedex/shared/data/pokemon.dart';
import 'package:pokedex/shared/extensions/pokemon_type_extensions.dart';

class AboutSuccess extends StatelessWidget {
  const AboutSuccess({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = pokemon.types.first.color.primary;
    final sectionTheme = textTheme.titleMedium?.copyWith(
      color: primaryColor,
      fontWeight: FontWeight.bold,
    );
    final About about =
        (context.watch<AboutCubit>().state as AboutSuccessState).about;

    final pokedexData = about.pokedexData;

    final items = <Widget>[
      //  Title
      Text(about.description, style: textTheme.bodyLarge),

      // Pokedex Data
      Text(AboutStrings.pokedexData, style: sectionTheme),
      AboutTile(title: AboutStrings.species, content: pokedexData.species),
      AboutTile(
          title: AboutStrings.height,
          content: pokedexData.height.toString()), // TODO: converte
      AboutTile(
          title: AboutStrings.weight,
          content: pokedexData.weight.toString()), // TODO: converte
      AboutTile.list(
        title: AboutStrings.abilities,
        items: pokedexData.abilities
            .map(
              (ability) => AboutTileItem(
                content:
                    '${ability.name}${ability.isHidden ? ' (hidden ability)' : ''}',
                small: !ability.isHidden,
              ),
            )
            .toList(),
      ),
      AboutTile.weaknesses(
        title: 'Weaknesses',
        weaknesses: pokedexData.weaknesses,
      ),
      // Trainning
      // Breeding
      // Location
    ];

    return ListView.separated(
        padding: const EdgeInsets.only(
          left: PokedexSpacing.kXL,
          right: PokedexSpacing.kXL,
        ),
        itemBuilder: (_, index) =>
            index < items.length ? items[index] : const SizedBox.shrink(),
        separatorBuilder: (_, index) {
          final double bottomSpacing;

          if ([0, items.length].contains(index)) {
            bottomSpacing = PokedexSpacing.kXL;
          } else if ([1].contains(index)) {
            bottomSpacing = PokedexSpacing.kXL;
          } else {
            bottomSpacing = PokedexSpacing.kM;
          }

          return SizedBox(height: bottomSpacing);
        },
        itemCount: items.length + 1);
  }
}
