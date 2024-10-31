import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

import '../../../shared/extensions/type_extensions.dart';
import 'entity/about_entity.dart';

abstract class AboutUseCase {
  Future<AboutEntity> getAbout(Pokemon pokemon);
}

@Injectable(as: AboutUseCase)
class AboutUseCaseImpl implements AboutUseCase {
  AboutUseCaseImpl(this._client);

  final Pokedex _client;
  @override
  Future<AboutEntity> getAbout(Pokemon pokemon) async {
    final species = await _client.pokemonSpecies.get(id: pokemon.id);
    final types = await Future.wait(pokemon.types
        .map((e) => e.type.url)
        .map((e) => _client.types.getByUrl(e)));

    final weaknesses = types.damageFrom.entries
        .where((element) => element.value > 1)
        .map((e) => e.key)
        .sortedBy((element) => element)
        .toList();

    return AboutEntity(
      pokemon: pokemon,
      pokemonSpecies: species,
      weaknesses: weaknesses,
    );
  }
}
