import 'package:injectable/injectable.dart';
import 'package:pokedex_flutter/feature/about/data/models/ability.dart';
import 'package:pokedex_flutter/feature/about/data/models/about.dart';
import 'package:pokedex_flutter/feature/about/data/models/breeding.dart';
import 'package:pokedex_flutter/feature/about/data/models/pokedex_data.dart';
import 'package:pokedex_flutter/feature/about/data/models/trainning.dart';

abstract class AboutService {
  Future<About> getAbout(int number);
}

@Injectable(as: AboutService)
class AboutServiceImpl extends AboutService {
  AboutServiceImpl();

  @override
  Future<About> getAbout(int number) async {
    // final result = await Future.wait([
    //   _dio.get('pokemon/$number'),
    //   _dio.get('pokemon-species/$number'),
    // ]);

    // TODO: Converte to flutter module

    // // [1] -> flavor_text_entries -> first -> flavor_text
    // final description = (result[1].data['flavor_text_entries'] as List<dynamic>)
    //         .first['flavor_text'] as String? ??
    //     '';

    return About(
      description: 'Lorem ipsum',
      pokedexData: PokedexData(
        species: 'Seed Pokémon',
        height: 0.7,
        weight: 6.9,
        abilities: [
          Ability(name: 'Overgrow', url: 'lorem', slot: 1, isHidden: false),
          Ability(name: 'Chlorophyl', url: 'lorem', slot: 2, isHidden: true),
        ],
        weaknesses: [
          'fire',
          'flying',
          'ice',
          'psychic',
        ],
        trainning: Trainning(
          captchRate: 45,
          baseExp: 64,
          growthRate: 'medium-slow',
        ),
        breeding: Breeding(
          eggGroups: ['Monster', 'Plant'],
          hatchCounter: 20,
          genderRate: 1,
        ),
      ),
    );
  }
}
