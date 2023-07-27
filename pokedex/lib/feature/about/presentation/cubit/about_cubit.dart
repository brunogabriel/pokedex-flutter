import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/about/data/about_repository.dart';
import 'package:pokedex_flutter/feature/about/data/models/about.dart';

part 'about_state.dart';

@injectable
class AboutCubit extends Cubit<AboutState> {
  AboutCubit(this._repository) : super(AboutInitialState());
  final AboutRepository _repository;

  void requestData(Pokemon pokemon) async {
    emit(AboutLoadingState());
    try {
      emit(AboutSuccessState(await _repository.getAbout(pokemon)));
    } catch (_) {
      emit(AboutFailureState());
    }
  }
}
