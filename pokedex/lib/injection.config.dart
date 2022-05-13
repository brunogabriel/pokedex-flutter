// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:chuck_interceptor/chuck.dart' as _i3;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'onboarding/data/repository/pokemon_repository.dart' as _i6;
import 'onboarding/data/service/onboarding_service.dart' as _i4;
import 'onboarding/domain/interactor/onboarding_interactor.dart' as _i8;
import 'pokemon/data/repository/pokemon_repository.dart' as _i9;
import 'pokemon/data/service/pokemon_service.dart' as _i7;
import 'pokemon/domain/interactor/pokemon_interactor.dart' as _i10;
import 'shared/network/di/network_module.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.Chuck>(() => networkModule.providesChuck());
  gh.factory<_i4.IOnboardingService>(() => _i4.OnboardingService());
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i5.Dio>(() => networkModule.provideDio(
      get<String>(instanceName: 'BaseUrl'), get<_i3.Chuck>()));
  gh.factory<_i6.IOnboardingRepository>(
      () => _i6.OnboardingRepository(get<_i4.IOnboardingService>()));
  gh.factory<_i7.IPokemonService>(() => _i7.PokemonService(get<_i5.Dio>()));
  gh.factory<_i8.IOnboardingInteractor>(
      () => _i8.OnboardingInteractor(get<_i6.IOnboardingRepository>()));
  gh.factory<_i9.IPokemonRepository>(
      () => _i9.PokemonRepository(service: get<_i7.IPokemonService>()));
  gh.factory<_i10.IPokemonInteractor>(
      () => _i10.PokemonInteractor(repository: get<_i9.IPokemonRepository>()));
  return get;
}

class _$NetworkModule extends _i11.NetworkModule {}
