import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/design/components/pokemon_information.dart';
import 'package:pokedex/shared/extensions/string_extensions.dart';

class DetailsPokemon extends StatelessWidget {
  final number = 4;
  const DetailsPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              SizedBox(
                width: 140,
                height: 140,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://raw.githubusercontent.com/HybridShivam/Pokemon/master/assets/thumbnails/${number.toString().padLeft(3, '0')}.png',
                ),
              ),
              const PokemonInformation(
                name: 'Charmander',
                number: 4,
                types: ['fire'],
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
