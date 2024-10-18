part of 'pokemon_list_bloc.dart';

sealed class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object?> get props => [];
}

class PokemonListEventRequest extends PokemonListEvent {
  const PokemonListEventRequest({
    this.limit = 100,
  });

  final int limit;

  @override
  List<Object> get props => [limit];
}
