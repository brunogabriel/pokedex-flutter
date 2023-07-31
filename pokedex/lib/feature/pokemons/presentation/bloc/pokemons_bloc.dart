import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/pokemons/domain/pokemons_use_case.dart';
import 'package:pokedex_flutter/shared/events/event_transformations.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

@injectable
class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  PokemonsBloc(this._useCase) : super(const PokemonsState()) {
    on<PokemonsRequestEvent>(_onRequestPokemons,
        transformer: throttleDroppable(
          const Duration(milliseconds: 100),
        ));
  }
  final PokemonsUseCase _useCase;

  Future<void> _onRequestPokemons(
    PokemonsRequestEvent event,
    Emitter<PokemonsState> emit,
  ) async {
    if (state.status == Status.finished &&
        event.searchQuery == null &&
        state.status != Status.failure &&
        state.status != Status.loading) {
      return;
    }

    emit(state.copyWith(status: Status.loading));

    try {
      if (event.searchQuery != null) {
        final pokemons =
            await _useCase.fetchPokemons(event.limit, 0, event.searchQuery);
        emit(
          state.forceWith(
            status: Status.finished,
            result: pokemons,
          ),
        );
      } else {
        final pokemons = await _useCase.fetchPokemons(
            event.limit, state.result.length, event.searchQuery);
        emit(
          state.copyWith(
            status: pokemons.isNotEmpty ? Status.success : Status.finished,
            result: pokemons,
          ),
        );
      }
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
