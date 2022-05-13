import 'package:injectable/injectable.dart';

import '../../data/repository/pokemon_repository.dart';
import '../model/pokemon.dart';

@Injectable(as: IPokemonInteractor)
class PokemonInteractor implements IPokemonInteractor {
  final IPokemonRepository _repository;

  const PokemonInteractor(
    this._repository,
  );

  @override
  Future<List<Pokemon>> takePokemons() async =>
      await _repository.fetchPokemons().then((value) =>
          value.map((response) => Pokemon.fromResponse(response)).toList());
}

abstract class IPokemonInteractor {
  Future<List<Pokemon>> takePokemons();
}
