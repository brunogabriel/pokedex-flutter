part of 'pokemons_bloc.dart';

abstract class PokemonsEvent extends Equatable {
  const PokemonsEvent();

  @override
  List<Object?> get props => [];
}

class PokemonsRequestEvent extends PokemonsEvent {
  const PokemonsRequestEvent({
    this.limit = 100,
    this.searchQuery,
  });

  final int limit;
  final String? searchQuery;

  @override
  List<Object?> get props => [limit, searchQuery];
}
