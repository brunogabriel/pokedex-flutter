import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/stats/data/models/stats_data.dart';

abstract class StatsRepository {
  Future<StatsData> getStats(Pokemon pokemon);
}

@Injectable(as: StatsRepository)
class StatsRepositoryImpl implements StatsRepository {
  StatsRepositoryImpl(this._client);

  final Pokedex _client;

  @override
  Future<StatsData> getStats(Pokemon pokemon) async {
    final species = await _client.pokemonSpecies.get(id: pokemon.id);
    return StatsData(pokemon: pokemon, pokemonSpecies: species);
  }
}
