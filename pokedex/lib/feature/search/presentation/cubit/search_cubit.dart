import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/search/domain/search_use_case.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._useCase) : super(SearchInitialState());

  final SearchUseCase _useCase;

  void requestResources() async {
    emit(SearchLoadingState());
    try {
      final allPokemons = await _useCase.getAllPokemons();
      emit(SearchSuccessState(allPokemons));
    } catch (_) {
      emit(SearchFailureState());
    }
  }
}
