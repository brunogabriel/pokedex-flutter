import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/design/components/badge_type.dart';
import 'package:pokedex/design/constants/pokedex_spacing.dart';
import 'package:pokedex/feature/about/data/models/about.dart';
import 'package:pokedex/feature/about/data/models/breeding.dart';
import 'package:pokedex/feature/about/presentation/cubit/about_cubit.dart';
import 'package:pokedex/feature/about/presentation/widgets/about_strings.dart';
import 'package:pokedex/feature/about/presentation/widgets/about_tile.dart';
import 'package:pokedex/shared/data/pokemon.dart';
import 'package:pokedex/shared/extensions/pokemon_type_extensions.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

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
    final trainning = pokedexData.trainning;
    final Breeding breeding = pokedexData.breeding;

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
          title: 'Weaknesses', weaknesses: pokedexData.weaknesses),
      // Trainning
      Text(AboutStrings.trainning, style: sectionTheme),
      AboutTile(
          title: AboutStrings.catchRate,
          content: trainning.captchRate.toString()),
      AboutTile(
          title: AboutStrings.baseExp, content: trainning.baseExp.toString()),
      AboutTile(
        title: AboutStrings.growthRate,
        content: trainning.growthRate.capitalizeKebabCase(),
      ),

      // Trainning
      Text(AboutStrings.breeding, style: sectionTheme),
      // TODO: Verify if gender is -1
      AboutTile.custom(
        title: AboutStrings.gender,
        custom: RichText(
          text: TextSpan(
            style: textTheme.bodyLarge,
            children: [
              TextSpan(
                  text: '♀ ',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey)),
              TextSpan(
                  text: '${breeding.femaleRate.toString()}%, ',
                  style: textTheme.bodyLarge),
              TextSpan(
                text: '♂ ',
                style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
              ),
              TextSpan(
                  text: '${breeding.maleRate.toString()}%',
                  style: textTheme.bodyLarge),
            ],
          ),
        ),
      ),

      AboutTile(
          title: AboutStrings.eggGroups,
          content: breeding.eggGroups.join(', ')),

      AboutTile.custom(
        title: AboutStrings.eggCycles,
        custom: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '${breeding.hatchCounter} ', style: textTheme.bodyLarge),
            TextSpan(
              text:
                  '(${breeding.hatchCounter * 244} - ${breeding.hatchCounter * 257} steps)',
              style: textTheme.bodySmall,
            )
          ]),
        ),
      )
    ];

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: PokedexSpacing.kXL,
        right: PokedexSpacing.kXL,
      ),
      itemBuilder: (_, index) => index < items.length
          ? items[index]
          : const SizedBox(
              height: PokedexSpacing.kL,
            ),
      separatorBuilder: (_, index) {
        final double bottomSpacing;
        if (index == 0) {
          bottomSpacing = PokedexSpacing.kXL;
        } else if ([1, 6, 7, 10, 11, 14].contains(index)) {
          bottomSpacing = PokedexSpacing.kL;
        } else {
          bottomSpacing = PokedexSpacing.kM;
        }

        return SizedBox(height: bottomSpacing);
      },
      itemCount: items.length + 1,
    );
  }
}
