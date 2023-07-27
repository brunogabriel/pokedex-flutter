// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex/feature/about/data/about_repository.dart' as _i8;
import 'package:pokedex/feature/about/data/service/about_service.dart' as _i5;
import 'package:pokedex/feature/about/presentation/cubit/about_cubit.dart'
    as _i9;
import 'package:pokedex/feature/pokemons/data/pokemons_repository.dart' as _i6;
import 'package:pokedex/feature/pokemons/data/service/pokemons_service.dart'
    as _i4;
import 'package:pokedex/feature/pokemons/presentation/bloc/pokemons_bloc.dart'
    as _i7;
import 'package:pokedex/network/network_module.dart' as _i10;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.singleton<_i3.Dio>(
      networkModule.provideDio(gh<String>(instanceName: 'BaseUrl')));
  gh.factory<_i4.PokemonService>(() => _i4.PokemonServiceImpl(gh<_i3.Dio>()));
  gh.factory<_i5.AboutService>(() => _i5.AboutServiceImpl(gh<_i3.Dio>()));
  gh.factory<_i6.PokemonRepository>(
      () => _i6.PokemonRepositoryImpl(gh<_i4.PokemonService>()));
  gh.factory<_i7.PokemonsBloc>(
      () => _i7.PokemonsBloc(gh<_i6.PokemonRepository>()));
  gh.factory<_i8.AboutRepository>(
      () => _i8.AboutRepositoryImpl(gh<_i5.AboutService>()));
  gh.factory<_i9.AboutCubit>(() => _i9.AboutCubit(gh<_i8.AboutRepository>()));
  return getIt;
}

class _$NetworkModule extends _i10.NetworkModule {}
