import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/theme/data/theme_repository.dart';

@injectable
class ThemeCubit extends Cubit<bool> {
  ThemeCubit(this._repository) : super(_repository.isDarkEnabled);

  final ThemeRepository _repository;

  void changeTheme() {
    _repository.changeTheme();
    emit(_repository.isDarkEnabled);
  }
}
