part of 'pokemon_list_cubit.dart';

enum Status { initial, loading, success, failure, finished }

class PokemonListState extends Equatable {
  const PokemonListState({
    this.status = Status.initial,
    this.result = const <Pokemon>[],
  });

  PokemonListState copyWith({Status? status, List<Pokemon>? result}) =>
      PokemonListState(
        status: status ?? this.status,
        result: this.result + (result ?? []),
      );

  final Status status;
  final List<Pokemon> result;

  bool get firstPage => result.isEmpty;

  @override
  List<Object> get props => [status, result];
}
