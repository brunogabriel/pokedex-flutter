part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {
  const PokemonInitial() : super();
}

class PokemonLoading extends PokemonState {
  const PokemonLoading() : super();
}

class PokemonError extends PokemonState {
  const PokemonError() : super();
}

class PokemonResult extends PokemonState {
  const PokemonResult(this.pokemons) : super();

  final List<Pokemon> pokemons;

  @override
  List<Object> get props => [pokemons];
}

class PokemonEmpty extends PokemonState {
  const PokemonEmpty() : super();
}
