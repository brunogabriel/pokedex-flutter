part of 'pokemon_list_bloc.dart';

enum PageStatus { initial, loading, success, failure, finished }

class PokemonListState extends Equatable {
  const PokemonListState({
    this.pageStatus = PageStatus.initial,
    this.result = const <Pokemon>[],
  });

  final PageStatus pageStatus;
  final List<Pokemon> result;

  PokemonListState copyWith({
    PageStatus? pageStatus,
    List<Pokemon>? result,
  }) =>
      PokemonListState(
        pageStatus: pageStatus ?? this.pageStatus,
        result: this.result + (result ?? []),
      );

  bool get firstPage => result.isEmpty;

  @override
  List<Object> get props => [
        pageStatus,
        result,
      ];
}
