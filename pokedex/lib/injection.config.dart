// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'pokemon/data/dao/pokemon_dao.dart' as _i5;
import 'pokemon/data/repository/pokemon_repository.dart' as _i7;
import 'pokemon/data/service/pokemon_service.dart' as _i6;
import 'pokemon/domain/use_case/pokemon_use_case.dart' as _i8;
import 'pokemon/presentation/bloc/pokemon_bloc.dart' as _i9;
import 'shared/database/di/pokemon_database_module.dart' as _i11;
import 'shared/database/pokemon_database.dart' as _i4;
import 'shared/network/di/network_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  final pokemonDatabaseModule = _$PokemonDatabaseModule();
  gh.factory<_i3.Interceptor>(() => networkModule.chuckerInterceptor,
      instanceName: 'ChuckerInterceptor');
  await gh.singletonAsync<_i4.PokemonDatabase>(
      () => pokemonDatabaseModule.database,
      preResolve: true);
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i3.Dio>(() => networkModule.provideClient(
      get<String>(instanceName: 'BaseUrl'),
      get<_i3.Interceptor>(instanceName: 'ChuckerInterceptor')));
  gh.factory<_i5.IPokemonDao>(() => _i5.PokemonDao(get<_i4.PokemonDatabase>()));
  gh.factory<_i6.IPokemonService>(() => _i6.PokemonService(get<_i3.Dio>()));
  gh.factory<_i7.IPokemonRepository>(() => _i7.PokemonRepository(
      get<_i6.IPokemonService>(), get<_i5.IPokemonDao>()));
  gh.factory<_i8.IPokemonUseCase>(
      () => _i8.PokemonUseCase(get<_i7.IPokemonRepository>()));
  gh.factory<_i9.PokemonBloc>(
      () => _i9.PokemonBloc(get<_i8.IPokemonUseCase>()));
  return get;
}

class _$NetworkModule extends _i10.NetworkModule {}

class _$PokemonDatabaseModule extends _i11.PokemonDatabaseModule {}
