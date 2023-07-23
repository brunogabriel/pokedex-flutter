part of 'pokemons_list_bloc.dart';

enum Status { initial, loading, success, failure, finished }

class PokemonsListState extends Equatable {
  const PokemonsListState({
    this.status = Status.initial,
    this.result = const <Pokemon>[],
  });

  PokemonsListState copyWith({
    Status? status,
    List<Pokemon>? result,
  }) =>
      PokemonsListState(
        status: status ?? this.status,
        result: this.result + (result ?? []),
      );

  final Status status;
  final List<Pokemon> result;

  bool get firstPage => result.isEmpty;

  @override
  List<Object> get props => [status, result];
}
