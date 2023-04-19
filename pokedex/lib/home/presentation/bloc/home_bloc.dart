import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/home/data/home_repository.dart';

import '../../../shared/event_transformations.dart';
import '../../data/models/pokemon_response.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repository) : super(const HomeState()) {
    on<HomeRequestEvent>(
      _onCharacterRequestEvent,
      transformer: throttleDroppable(
        const Duration(milliseconds: 100),
      ),
    );
  }

  final HomeRepository _repository;

  Future<void> _onCharacterRequestEvent(
    HomeRequestEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) {
      return;
    }

    emit(state.copyWith(result: ResultState.loading));

    try {
      final response = await _repository.getPokemons(state.offset);

      emit(
        state.copyWith(
          offset: state.offset + response.results.length,
          pokemons: List.of(state.pokemons)..addAll(response.results),
          hasReachedMax: state.offset >= (response.count),
        ),
      );
    } catch (_) {
      emit(state.copyWith(result: ResultState.error));
    }
  }
}
