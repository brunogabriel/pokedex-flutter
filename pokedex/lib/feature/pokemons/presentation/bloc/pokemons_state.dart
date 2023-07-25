part of 'pokemons_bloc.dart';

enum Status { initial, loading, success, failure, finished }

class PokemonsState extends Equatable {
  const PokemonsState({
    this.status = Status.initial,
    this.result = const <Pokemon>[],
  });

  PokemonsState copyWith({
    Status? status,
    List<Pokemon>? result,
  }) =>
      PokemonsState(
        status: status ?? this.status,
        result: this.result + (result ?? []),
      );

  final Status status;
  final List<Pokemon> result;

  bool get firstPage => result.isEmpty;

  @override
  List<Object> get props => [status, result];
}
