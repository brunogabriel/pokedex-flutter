import 'package:injectable/injectable.dart';
import 'package:pokedex/pokemon/data/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/domain/models/pokemon.dart';

@Injectable(as: IPokemonUseCase)
class PokemonUseCase implements IPokemonUseCase {
  final IPokemonRepository _repository;

  const PokemonUseCase(this._repository);

  @override
  Future<List<Pokemon>> getPokemons() => _repository
      .getPokemons()
      .then((value) => value.map((data) => Pokemon.fromData(data)).toList());
}

abstract class IPokemonUseCase {
  Future<List<Pokemon>> getPokemons();
}
