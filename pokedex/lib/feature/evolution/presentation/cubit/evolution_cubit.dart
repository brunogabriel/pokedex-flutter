import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/evolution/domain/evolution_use_case.dart';

part 'evolution_state.dart';

@injectable
class EvolutionCubit extends Cubit<EvolutionState> {
  EvolutionCubit(this._useCase) : super(EvolutionInitialState());

  final EvolutionUseCase _useCase;

  void requestEvolutionChain(int id) async {
    emit(EvolutionLoadingState());
    try {
      final evolutionChain = await _useCase.getChainLink(id);
      emit(EvolutionSuccessState(evolutionChain));
    } catch (_) {
      emit(EvolutionFailureState());
    }
  }
}
