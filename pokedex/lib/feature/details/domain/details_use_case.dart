import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class DetailsUseCase {
  Future<Pokemon> getPokemon(int id);
}

@Injectable(as: DetailsUseCase)
class DetailsUseCaseImpl implements DetailsUseCase {
  DetailsUseCaseImpl(this._client);

  final Pokedex _client;

  @override
  Future<Pokemon> getPokemon(int id) => _client.pokemon.get(id: id);
}
