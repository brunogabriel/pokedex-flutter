import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PreferencesModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();
}
