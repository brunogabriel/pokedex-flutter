import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/common/events/events_transformations.dart';
import '../../domain/boundary/pokemon_list_repository.dart';
import '../../domain/model/pokemon.dart';
part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

@injectable
class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc(this._repository) : super(const PokemonListState()) {
    on<PokemonListEventRequest>(
      _onRequestPokemons,
      transformer: throttleDroppable(
        const Duration(milliseconds: 100),
      ),
    );
  }

  final PokemonListRepository _repository;

  Future<void> _onRequestPokemons(
    PokemonListEventRequest event,
    Emitter<PokemonListState> emit,
  ) async {
    if (state.pageStatus == PageStatus.finished &&
        state.pageStatus != PageStatus.failure &&
        state.pageStatus != PageStatus.loading) {
      return;
    }

    emit(state.copyWith(pageStatus: PageStatus.loading));

    try {
      final response = await _repository.getPokemons(
        limit: event.limit,
        offset: state.result.length,
      );
      emit(
        state.copyWith(
          result: response.pokemons,
          pageStatus:
              response.hasNext ? PageStatus.success : PageStatus.finished,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          pageStatus: PageStatus.failure,
        ),
      );
    }
  }
}
