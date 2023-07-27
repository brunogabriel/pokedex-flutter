import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';

@module
abstract class NetworkModule {
  @singleton
  Pokedex get pokedex => Pokedex();
}
