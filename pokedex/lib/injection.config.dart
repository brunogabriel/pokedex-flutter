// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:chucker_flutter/chucker_flutter.dart' as _i3;
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'onboarding/data/repository/pokemon_repository.dart' as _i7;
import 'onboarding/data/service/onboarding_service.dart' as _i4;
import 'onboarding/domain/interactor/onboarding_interactor.dart' as _i10;
import 'pokemon/data/dao/pokemon_dao.dart' as _i8;
import 'pokemon/data/repository/pokemon_repository.dart' as _i11;
import 'pokemon/data/service/pokemon_service.dart' as _i9;
import 'pokemon/domain/interactor/pokemon_interactor.dart' as _i12;
import 'shared/database/di/database_module.dart' as _i14;
import 'shared/database/pokemon_database.dart' as _i5;
import 'shared/network/di/network_module.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  final databaseModule = _$DatabaseModule();
  gh.lazySingleton<_i3.ChuckerDioInterceptor>(
      () => networkModule.providesChucker());
  gh.factory<_i4.IOnboardingService>(() => _i4.OnboardingService());
  await gh.singletonAsync<_i5.PokemonDatabase>(() => databaseModule.database,
      preResolve: true);
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i6.Dio>(() => networkModule.provideDio(
      get<String>(instanceName: 'BaseUrl'), get<_i3.ChuckerDioInterceptor>()));
  gh.factory<_i7.IOnboardingRepository>(
      () => _i7.OnboardingRepository(get<_i4.IOnboardingService>()));
  gh.factory<_i8.IPokemonDao>(() => _i8.PokemonDao(get<_i5.PokemonDatabase>()));
  gh.factory<_i9.IPokemonService>(() => _i9.PokemonService(get<_i6.Dio>()));
  gh.factory<_i10.IOnboardingInteractor>(
      () => _i10.OnboardingInteractor(get<_i7.IOnboardingRepository>()));
  gh.factory<_i11.IPokemonRepository>(() => _i11.PokemonRepository(
      get<_i9.IPokemonService>(), get<_i8.IPokemonDao>()));
  gh.factory<_i12.IPokemonInteractor>(
      () => _i12.PokemonInteractor(get<_i11.IPokemonRepository>()));
  return get;
}

class _$NetworkModule extends _i13.NetworkModule {}

class _$DatabaseModule extends _i14.DatabaseModule {}
