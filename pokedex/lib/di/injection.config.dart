// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex/feature/pokemons/data/pokemons_repository.dart' as _i8;
import 'package:pokedex/feature/pokemons/data/service/pokemons_service.dart'
    as _i6;
import 'package:pokedex/feature/pokemons/presentation/bloc/pokemons_list_bloc.dart'
    as _i9;
import 'package:pokedex/network/network_module.dart' as _i10;
import 'package:pokedex/preferences/preferences_module.dart' as _i11;
import 'package:pokedex/theme/cubit/theme_cubit.dart' as _i7;
import 'package:pokedex/theme/data/theme_repository.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final preferencesModule = _$PreferencesModule();
  final networkModule = _$NetworkModule();
  await gh.singletonAsync<_i3.SharedPreferences>(
    () => preferencesModule.sharedPrefs,
    preResolve: true,
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i4.ThemeRepository>(
      () => _i4.ThemeRepositoryImpl(gh<_i3.SharedPreferences>()));
  gh.singleton<_i5.Dio>(
      networkModule.provideDio(gh<String>(instanceName: 'BaseUrl')));
  gh.factory<_i6.PokemonService>(() => _i6.PokemonServiceImpl(gh<_i5.Dio>()));
  gh.factory<_i7.ThemeCubit>(() => _i7.ThemeCubit(gh<_i4.ThemeRepository>()));
  gh.factory<_i8.PokemonRepository>(
      () => _i8.PokemonRepositoryImpl(gh<_i6.PokemonService>()));
  gh.factory<_i9.PokemonsListBloc>(
      () => _i9.PokemonsListBloc(gh<_i8.PokemonRepository>()));
  return getIt;
}

class _$NetworkModule extends _i10.NetworkModule {}

class _$PreferencesModule extends _i11.PreferencesModule {}
