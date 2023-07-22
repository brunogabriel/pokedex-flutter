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
import 'package:pokedex/feature/pokemons/data/pokemons_repository.dart' as _i5;
import 'package:pokedex/feature/pokemons/data/service/pokemons_service.dart'
    as _i4;
import 'package:pokedex/feature/pokemons/presentation/cubit/pokemon_list_cubit.dart'
    as _i6;
import 'package:pokedex/network/network_module.dart' as _i7;

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
  gh.factory<_i5.PokemonRepository>(
      () => _i5.PokemonRepositoryImpl(gh<_i4.PokemonService>()));
  gh.factory<_i6.PokemonListCubit>(
      () => _i6.PokemonListCubit(gh<_i5.PokemonRepository>()));
  return getIt;
}

class _$NetworkModule extends _i7.NetworkModule {}
