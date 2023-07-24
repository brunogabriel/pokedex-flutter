import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeRepository {
  bool get isDarkEnabled;
  void changeTheme();
}

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;
  final String _isDarkEnabledString = '';

  @override
  void changeTheme() {
    _sharedPreferences.setBool(_isDarkEnabledString, !isDarkEnabled);
  }

  @override
  bool get isDarkEnabled {
    try {
      return _sharedPreferences.getBool(_isDarkEnabledString) ?? false;
    } catch (_) {
      return false;
    }
  }
}
