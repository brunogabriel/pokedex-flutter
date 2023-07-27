import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/about/data/models/ability.dart';
import 'package:pokedex/feature/about/data/models/about.dart';
import 'package:pokedex/feature/about/data/models/pokedex_data.dart';
import 'package:pokedex/feature/about/data/service/about_service.dart';

abstract class AboutRepository {
  Future<About> getAbout(int number);
}

@Injectable(as: AboutRepository)
class AboutRepositoryImpl implements AboutRepository {
  AboutRepositoryImpl(this._service);

  final AboutService _service;

  @override
  Future<About> getAbout(int number) async {
    await Future.delayed(const Duration(seconds: 2));

    return About(
      description:
          'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun`s rays, the seed grows progressively larger.',
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
      ),
    );
  }
}
