import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/design/components/pokemon_information.dart';
import 'package:pokedex/shared/data/pokemon.dart';
import 'package:pokedex/shared/extensions/int_extensions.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class DetailsPokemon extends StatelessWidget {
  const DetailsPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 140,
                height: 140,
                child: CachedNetworkImage(
                  imageUrl: pokemon.number.thumbnailUrl,
                ),
              ),
              PokemonInformation(
                pokemon: pokemon,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          DefaultTabController(
            length: 3,
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              dividerColor: Colors.transparent,
              labelStyle:
                  textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
              unselectedLabelStyle: textTheme.labelLarge,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/mask_pokeball.png'.asset(),
                  ),
                ),
              ),
              tabs: const [
                Tab(
                  child: Text('About'),
                ),
                Tab(
                  child: Text('Stats'),
                ),
                Tab(
                  child: Text('Evolution'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
