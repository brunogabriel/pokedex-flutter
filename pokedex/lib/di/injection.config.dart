// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex/pokedex.dart' as _i4;
import 'package:pokedex_flutter/feature/about/data/about_repository.dart'
    as _i7;
import 'package:pokedex_flutter/feature/about/data/service/about_service.dart'
    as _i3;
import 'package:pokedex_flutter/feature/about/presentation/cubit/about_cubit.dart'
    as _i8;
import 'package:pokedex_flutter/feature/pokemons/data/pokemons_repository.dart'
    as _i5;
import 'package:pokedex_flutter/feature/pokemons/presentation/bloc/pokemons_bloc.dart'
    as _i6;
import 'package:pokedex_flutter/network/network_module.dart' as _i9;

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
  gh.factory<_i3.AboutService>(() => _i3.AboutServiceImpl());
  gh.singleton<_i4.Pokedex>(networkModule.pokedex);
  gh.factory<_i5.PokemonRepository>(() => _i5.PokemonRepositoryImpl());
  gh.factory<_i6.PokemonsBloc>(
      () => _i6.PokemonsBloc(gh<_i5.PokemonRepository>()));
  gh.factory<_i7.AboutRepository>(
      () => _i7.AboutRepositoryImpl(gh<_i3.AboutService>()));
  gh.factory<_i8.AboutCubit>(() => _i8.AboutCubit(gh<_i7.AboutRepository>()));
  return getIt;
}

class _$NetworkModule extends _i9.NetworkModule {}
