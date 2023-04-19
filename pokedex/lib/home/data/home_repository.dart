import 'package:injectable/injectable.dart';
import 'package:pokedex/home/data/models/home_result_response.dart';
import 'package:pokedex/pokemon/data/pokemon_service.dart';

abstract class HomeRepository {
  Future<HomeResponseResponse> getPokemons(int offset);
}

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this._service);

  final PokemonService _service;
  @override
  Future<HomeResponseResponse> getPokemons(int offset) async {
    final pokemons = await _service.getPokemons(offset);
    final details = await Future.wait(
        pokemons.results.map((e) => _service.getPokemonDetails(e.name)));

    return HomeResponseResponse(pokemons.count, details);
  }
}
