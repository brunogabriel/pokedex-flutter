import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/design/constants/pokedex_spacing.dart';
import 'package:pokedex_flutter/design/constants/pokedex_theme_data.dart';
import 'package:pokedex_flutter/shared/extensions/int_extensions.dart';
import 'package:pokedex_flutter/shared/extensions/string_extensions.dart';

class SearchPokemonDelegate extends SearchDelegate<String> {
  SearchPokemonDelegate(
    this.resources,
  ) : super(
          searchFieldLabel: 'What a Pokémon are you looking for?',
          searchFieldStyle: TextStyle(
            color: PokedexThemeData.textBlack,
            fontWeight: FontWeight.normal,
          ),
        );

  final List<NamedAPIResource> resources;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          close(context, '');
          context.pop();
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = '';
        close(context, '');
        context.pop();
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) => const SizedBox.shrink();

  @override
  void close(BuildContext context, String result) {
    if (result.isNotEmpty) {
      context.pushReplacementNamed(
        'details',
        pathParameters: {'id': getNumber(result).toString()},
      );
    } else {
      super.close(context, result);
    }
  }

  int getNumber(String result) {
    return resources
        .firstWhere((element) => element.name == result)
        .url
        .getNumberFromPokemonUrl();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final suggestions = query.isEmpty
        ? resources.take(30).toList()
        : resources
            .where((element) =>
                (element.name.toLowerCase()).startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        minLeadingWidth: PokedexSpacing.kXL,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: PokedexSpacing.kL,
          vertical: PokedexSpacing.kS,
        ),
        onTap: () {
          query = suggestions[index].name;
          close(context, query);
        },
        leading: SizedBox(
          width: 24,
          height: 24,
          child: CachedNetworkImage(
            color: PokedexThemeData.greyLevelMedium,
            imageUrl:
                suggestions[index].url.getNumberFromPokemonUrl().thumbnailUrl,
            errorWidget: (_, __, ___) => const SizedBox.shrink(),
          ),
        ),
        title: RichText(
          text: TextSpan(
            text:
                suggestions[index].name.capitalize().substring(0, query.length),
            style: textTheme.bodyMedium
                ?.copyWith(color: PokedexThemeData.textBlack),
            children: [
              if (query.isEmpty) ...{
                TextSpan(
                  text: suggestions[index].name.capitalize(),
                  style: textTheme.bodyMedium
                      ?.copyWith(color: PokedexThemeData.textNumber),
                ),
              } else ...{
                TextSpan(
                    text: suggestions[index].name.substring(query.length),
                    style: textTheme.bodyMedium
                        ?.copyWith(color: PokedexThemeData.textNumber)),
              }
            ],
          ),
        ),
      ),
      itemCount: suggestions.length,
    );
  }
}
