import 'package:injectable/injectable.dart';
import 'package:pokedex/shared/database/pokemon_database.dart';

@module
abstract class DatabaseModule {
  @singleton
  @preResolve
  Future<PokemonDatabase> get database => PokemonDatabaseInitializer.init();
}

class PokemonDatabaseInitializer {
  static Future<PokemonDatabase> init() async {
    var pokemon = PokemonDatabase();
    return pokemon;
  }
}
