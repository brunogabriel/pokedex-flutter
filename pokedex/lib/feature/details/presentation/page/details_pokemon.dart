import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/design/components/pokemon_information.dart';

class DetailsPokemon extends StatelessWidget {
  final number = 4;
  const DetailsPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 32,
          ),
          DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: TabBar(tabs: [
              Tab(
                child: Text('About'),
              ),
              Tab(
                child: Text('Stats'),
              ),
              Tab(
                child: Text('Evolution'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
