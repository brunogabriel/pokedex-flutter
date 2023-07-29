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
import 'package:pokedex/pokedex.dart' as _i3;
import 'package:pokedex_flutter/feature/about/data/about_repository.dart'
    as _i6;
import 'package:pokedex_flutter/feature/about/presentation/cubit/about_cubit.dart'
    as _i10;
import 'package:pokedex_flutter/feature/details/data/details_repository.dart'
    as _i7;
import 'package:pokedex_flutter/feature/details/presentation/cubit/details_cubit.dart'
    as _i11;
import 'package:pokedex_flutter/feature/evolution/data/evolution_repository.dart'
    as _i8;
import 'package:pokedex_flutter/feature/evolution/domain/evolution_use_case.dart'
    as _i9;
import 'package:pokedex_flutter/feature/evolution/presentation/cubit/evolution_cubit.dart'
    as _i12;
import 'package:pokedex_flutter/feature/pokemons/data/pokemons_repository.dart'
    as _i4;
import 'package:pokedex_flutter/feature/pokemons/presentation/bloc/pokemons_bloc.dart'
    as _i5;
import 'package:pokedex_flutter/network/network_module.dart' as _i13;

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
  gh.singleton<_i3.Pokedex>(networkModule.pokedex);
  gh.factory<_i4.PokemonRepository>(
      () => _i4.PokemonRepositoryImpl(gh<_i3.Pokedex>()));
  gh.factory<_i5.PokemonsBloc>(
      () => _i5.PokemonsBloc(gh<_i4.PokemonRepository>()));
  gh.factory<_i6.AboutRepository>(
      () => _i6.AboutRepositoryImpl(gh<_i3.Pokedex>()));
  gh.factory<_i7.DetailsRepository>(
      () => _i7.DetailsRepositoryImpl(gh<_i3.Pokedex>()));
  gh.factory<_i8.EvolutionRepository>(
      () => _i8.EvolutionRepositoryImpl(gh<_i3.Pokedex>()));
  gh.factory<_i9.EvolutionUseCase>(
      () => _i9.EvolutionUseCaseImpl(gh<_i8.EvolutionRepository>()));
  gh.factory<_i10.AboutCubit>(() => _i10.AboutCubit(gh<_i6.AboutRepository>()));
  gh.factory<_i11.DetailsCubit>(
      () => _i11.DetailsCubit(gh<_i7.DetailsRepository>()));
  gh.factory<_i12.EvolutionCubit>(
      () => _i12.EvolutionCubit(gh<_i9.EvolutionUseCase>()));
  return getIt;
}

class _$NetworkModule extends _i13.NetworkModule {}
