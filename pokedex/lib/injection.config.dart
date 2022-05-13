// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:chuck_interceptor/chuck.dart' as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'pokemon/data/repository/pokemon_repository.dart' as _i6;
import 'pokemon/data/service/pokemon_service.dart' as _i5;
import 'pokemon/domain/interactor/pokemon_interactor.dart' as _i7;
import 'shared/network/di/network_module.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.Chuck>(() => networkModule.providesChuck());
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i4.Dio>(() => networkModule.provideDio(
      get<String>(instanceName: 'BaseUrl'), get<_i3.Chuck>()));
  gh.factory<_i5.IPokemonService>(() => _i5.PokemonService(get<_i4.Dio>()));
  gh.factory<_i6.IPokemonRepository>(
      () => _i6.PokemonRepository(service: get<_i5.IPokemonService>()));
  gh.factory<_i7.IPokemonInteractor>(
      () => _i7.PokemonInteractor(repository: get<_i6.IPokemonRepository>()));
  return get;
}

class _$NetworkModule extends _i8.NetworkModule {}
