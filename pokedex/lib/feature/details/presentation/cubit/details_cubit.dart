import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/details/data/details_repository.dart';

part 'details_state.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._repository) : super(DetailsInitialState());

  final DetailsRepository _repository;

  void requestPokemon(int id) async {
    emit(DetailsLoadingState());
    try {
      // Animation duration
      await Future.delayed(const Duration(milliseconds: 750));
      final pokemon = await _repository.getPokemon(id);
      emit(DetailsSuccessState(pokemon));
    } catch (_) {
      emit(DetailsLoadingState());
    }
  }
}
