import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokemon/domain/pokemon_domain_barrel.dart';
import 'package:bloc/bloc.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

@injectable
class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final IPokemonUseCase _useCase;

  PokemonBloc(this._useCase) : super(const PokemonInitial()) {
    on<PokemonRequest>(_onPokemonRequest);
  }

  void _onPokemonRequest(event, emit) async {
    emit(const PokemonLoading());
    try {
      var pokemons = await _useCase.getPokemons();
      if (pokemons.isNotEmpty) {
        emit(PokemonResult(pokemons));
      } else {
        emit(const PokemonEmpty());
      }
    } catch (_) {
      emit(const PokemonError());
    }
  }
}
