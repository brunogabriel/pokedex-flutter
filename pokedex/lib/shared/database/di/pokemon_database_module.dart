import 'package:injectable/injectable.dart';
import 'package:pokedex/shared/database/pokemon_database.dart';

@module
abstract class PokemonDatabaseModule {
  @singleton
  @preResolve
  Future<PokemonDatabase> get database => _init();

  Future<PokemonDatabase> _init() async => PokemonDatabase();
}
