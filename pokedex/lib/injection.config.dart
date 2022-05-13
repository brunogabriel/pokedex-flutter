// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'pokemon/data/repository/pokemon_repository.dart' as _i5;
import 'pokemon/data/service/pokemon_service.dart' as _i4;
import 'pokemon/domain/interactor/pokemon_interactor.dart' as _i6;
import 'shared/network/di/network_module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i3.Dio>(
      () => networkModule.provideDio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i4.IPokemonService>(() => _i4.PokemonService(get<_i3.Dio>()));
  gh.factory<_i5.IPokemonRepository>(
      () => _i5.PokemonRepository(service: get<_i4.IPokemonService>()));
  gh.factory<_i6.IPokemonInteractor>(
      () => _i6.PokemonInteractor(repository: get<_i5.IPokemonRepository>()));
  return get;
}

class _$NetworkModule extends _i7.NetworkModule {}
