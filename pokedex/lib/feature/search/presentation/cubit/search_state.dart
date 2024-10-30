part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchFailureState extends SearchState {}

class SearchSuccessState extends SearchState {
  SearchSuccessState(this.result);

  final List<NamedAPIResource> result;

  @override
  List<Object> get props => [result];
}
