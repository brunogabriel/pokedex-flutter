part of 'pokemons_list_bloc.dart';

abstract class PokemonsListEvent extends Equatable {
  const PokemonsListEvent();

  @override
  List<Object> get props => [];
}

class PokemonsListRequestEvent extends PokemonsListEvent {}
