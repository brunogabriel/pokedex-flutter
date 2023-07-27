import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

abstract class DetailsRepository {
  Future<Pokemon> getPokemon(int id);
}

@Injectable(as: DetailsRepository)
class DetailsRepositoryImpl implements DetailsRepository {
  DetailsRepositoryImpl(this._client);

  final Pokedex _client;

  @override
  Future<Pokemon> getPokemon(int id) => _client.pokemon.get(id: id);
}
