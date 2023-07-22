import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/pokemons/data/models/pokemon.dart';
import 'package:pokedex/feature/pokemons/data/pokemons_repository.dart';

part 'pokemon_list_state.dart';

@injectable
class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit(this._repository) : super(const PokemonListState());

  final PokemonRepository _repository;

  void requestPokemons(int offset, [int limit = 10]) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final pokemons = await _repository.getPokemons(limit, offset);

      emit(state.copyWith(
          status: pokemons.isNotEmpty ? Status.success : Status.finished,
          result: pokemons));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
      // TODO do something with error
    }
  }
}