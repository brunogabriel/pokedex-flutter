import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/about/data/about_repository.dart';
import 'package:pokedex/feature/about/data/models/about.dart';

part 'about_state.dart';

@injectable
class AboutCubit extends Cubit<AboutState> {
  AboutCubit(this._repository) : super(AboutInitialState());
  final AboutRepository _repository;

  void requestData(int number) async {
    emit(AboutLoadingState());
    try {
      emit(AboutSuccessState(await _repository.getAbout(number)));
    } catch (_) {
      emit(AboutFailureState());
    }
  }
}
