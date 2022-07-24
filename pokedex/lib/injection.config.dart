// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'pokemon/data/pokemon_data_barrel.dart' as _i4;
import 'pokemon/data/repository/pokemon_repository.dart' as _i9;
import 'pokemon/data/service/pokemon_service.dart' as _i8;
import 'pokemon/domain/pokemon_domain_barrel.dart' as _i6;
import 'pokemon/domain/use_case/pokemon_use_case.dart' as _i3;
import 'pokemon/presentation/bloc/pokemon_bloc.dart' as _i5;
import 'shared/network/di/network_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.factory<_i3.IPokemonUseCase>(
      () => _i3.PokemonUseCase(get<_i4.IPokemonRepository>()));
  gh.factory<_i5.PokemonBloc>(
      () => _i5.PokemonBloc(get<_i6.IPokemonUseCase>()));
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i7.Dio>(
      () => networkModule.provideClient(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i8.IPokemonService>(() => _i8.PokemonService(get<_i7.Dio>()));
  gh.factory<_i9.IPokemonRepository>(
      () => _i9.PokemonRepository(get<_i8.IPokemonService>()));
  return get;
}

class _$NetworkModule extends _i10.NetworkModule {}
