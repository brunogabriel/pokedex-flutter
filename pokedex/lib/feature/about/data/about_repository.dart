import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/about/data/models/about.dart';
import 'package:pokedex_flutter/shared/extensions/type_extensions.dart';

abstract class AboutRepository {
  Future<About> getAbout(Pokemon pokemon);
}

@Injectable(as: AboutRepository)
class AboutRepositoryImpl implements AboutRepository {
  AboutRepositoryImpl(this._client);

  final Pokedex _client;

  @override
  Future<About> getAbout(Pokemon pokemon) async {
    final species = await _client.pokemonSpecies.get(id: pokemon.id);
    final types = await Future.wait(pokemon.types
        .map((e) => e.type.url)
        .map((e) => _client.types.getByUrl(e)));

    final weaknesses = types.damageFrom.entries
        .where((element) => element.value > 1)
        .map((e) => e.key)
        .sortedBy((element) => element)
        .toList();

    return About(
      pokemon: pokemon,
      pokemonSpecies: species,
      weaknesses: weaknesses,
    );
  }
}
