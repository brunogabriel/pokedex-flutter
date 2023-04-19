part of 'home_bloc.dart';

enum ResultState { initial, loading, error, result }

class HomeState extends Equatable {
  const HomeState({
    this.offset = 0,
    this.pokemons = const <PokemonResponse>[],
    this.hasReachedMax = false,
    this.result = ResultState.initial,
  });

  final int offset;
  final List<PokemonResponse> pokemons;
  final bool hasReachedMax;
  final ResultState result;

  @override
  List<Object> get props => [offset, pokemons, hasReachedMax, result];

  bool get isFirstPage => offset == 0;

  HomeState copyWith({
    int? offset,
    bool? hasReachedMax,
    List<PokemonResponse>? pokemons,
    ResultState? result,
  }) =>
      HomeState(
        offset: offset ?? this.offset,
        pokemons: pokemons ?? this.pokemons,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        result: result ?? this.result,
      );
}
