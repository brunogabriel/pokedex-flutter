part of 'pokemons_bloc.dart';

abstract class PokemonsEvent extends Equatable {
  const PokemonsEvent();

  @override
  List<Object> get props => [];
}

class PokemonsRequestEvent extends PokemonsEvent {}
