import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/pokemons/data/models/pokemon.dart';
import 'package:pokedex/feature/pokemons/data/pokemons_repository.dart';
import 'package:pokedex/shared/events/event_transformations.dart';

part 'pokemons_list_event.dart';
part 'pokemons_list_state.dart';

@injectable
class PokemonsListBloc extends Bloc<PokemonsListEvent, PokemonsListState> {
  PokemonsListBloc(this._repository) : super(const PokemonsListState()) {
    on<PokemonsListEvent>(_onRequestPokemons,
        transformer: throttleDroppable(
          const Duration(milliseconds: 100),
        ));
  }

  final PokemonRepository _repository;

  Future<void> _onRequestPokemons(
    PokemonsListEvent event,
    Emitter<PokemonsListState> emit,
  ) async {
    if (state.status == Status.finished) {
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
