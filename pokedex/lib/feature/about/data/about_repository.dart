import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/about/data/models/about.dart';

abstract class AboutRepository {
  Future<About> getAbout(Pokemon pokemon);
}

@Injectable(as: AboutRepository)
class AboutRepositoryImpl implements AboutRepository {
  AboutRepositoryImpl();

  @override
  Future<About> getAbout(Pokemon pokemon) async {
    final species = await Pokedex().pokemonSpecies.get(name: pokemon.name);
    return About(pokemon: pokemon, pokemonSpecies: species);
  }
}
