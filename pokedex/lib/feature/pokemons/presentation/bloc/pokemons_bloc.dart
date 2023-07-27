import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/pokemons/data/pokemons_repository.dart';
import 'package:pokedex_flutter/shared/events/event_transformations.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

@injectable
class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  PokemonsBloc(this._repository) : super(const PokemonsState()) {
    on<PokemonsEvent>(_onRequestPokemons,
        transformer: throttleDroppable(
          const Duration(milliseconds: 100),
        ));
  }
  final PokemonRepository _repository;

  Future<void> _onRequestPokemons(
    PokemonsEvent event,
    Emitter<PokemonsState> emit,
  ) async {
    if (state.status == Status.finished &&
        state.status != Status.failure &&
        state.status != Status.loading) {
      return;
    }

    emit(state.copyWith(status: Status.loading));
    try {
      final pokemons = await _repository.getPokemons(10, state.result.length);
      emit(state.copyWith(
        status: pokemons.isNotEmpty ? Status.success : Status.finished,
        result: pokemons,
      ));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
