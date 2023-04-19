import 'package:injectable/injectable.dart';
import 'package:pokedex/home/data/service/home_service.dart';

import 'models/pokemon_result_response.dart';

abstract class HomeRepository {
  Future<PokemonResultResponse> getPokemons(int offset);
}

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this._service);

  final HomeService _service;
  @override
  Future<PokemonResultResponse> getPokemons(int offset) =>
      _service.getPokemons(offset);
}
