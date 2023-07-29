import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/about/data/models/about.dart';

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

    final doubleDamageFrom = types
        .map((type) => type.damageRelations.doubleDamageFrom
            .map((resource) => resource.name))
        .expand((element) => element)
        .toList();

    final halfDamageFrom = types
        .map((type) => type.damageRelations.halfDamageFrom
            .map((resource) => resource.name))
        .expand((element) => element)
        .toList();

    final weaknesses = doubleDamageFrom
        .whereNot((element) => halfDamageFrom.contains(element))
        .toSet()
        .sortedBy((element) => element)
        .toList();

    return About(
      pokemon: pokemon,
      pokemonSpecies: species,
      weaknesses: weaknesses,
    );
  }
}
