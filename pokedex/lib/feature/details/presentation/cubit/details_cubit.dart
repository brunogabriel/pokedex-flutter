import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/details/domain/details_use_case.dart';

part 'details_state.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._useCase) : super(DetailsInitialState());

  final DetailsUseCase _useCase;

  void requestPokemon(int id) async {
    emit(DetailsLoadingState());
    try {
      // Animation duration
      await Future.delayed(const Duration(milliseconds: 750));
      final pokemon = await _useCase.getPokemon(id);
      emit(DetailsSuccessState(pokemon));
    } catch (_) {
      emit(DetailsFailureState());
    }
  }
}
