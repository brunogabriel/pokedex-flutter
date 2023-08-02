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
import 'package:pokedex_flutter/feature/about/domain/about_use_case.dart'
    as _i8;
import 'package:pokedex_flutter/feature/about/presentation/cubit/about_cubit.dart'
    as _i13;
import 'package:pokedex_flutter/feature/details/domain/details_use_case.dart'
    as _i9;
import 'package:pokedex_flutter/feature/details/presentation/cubit/details_cubit.dart'
    as _i14;
import 'package:pokedex_flutter/feature/evolution/domain/evolution_use_case.dart'
    as _i10;
import 'package:pokedex_flutter/feature/evolution/domain/mapper/evolution_mapper.dart'
    as _i3;
import 'package:pokedex_flutter/feature/evolution/presentation/cubit/evolution_cubit.dart'
    as _i15;
import 'package:pokedex_flutter/feature/pokemons/domain/pokemons_use_case.dart'
    as _i5;
import 'package:pokedex_flutter/feature/pokemons/presentation/bloc/pokemons_bloc.dart'
    as _i11;
import 'package:pokedex_flutter/feature/stats/data/stats_repository.dart'
    as _i6;
import 'package:pokedex_flutter/feature/stats/domain/stats_use_case.dart'
    as _i7;
import 'package:pokedex_flutter/feature/stats/presentation/cubit/stats_cubit.dart'
    as _i12;
import 'package:pokedex_flutter/network/network_module.dart' as _i16;

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
  gh.factory<_i3.EvolutionMapper>(() => _i3.EvolutionMapperImpl());
  gh.singleton<_i4.Pokedex>(networkModule.pokedex);
  gh.factory<_i5.PokemonsUseCase>(
      () => _i5.PokemonsUseCaseImpl(gh<_i4.Pokedex>()));
  gh.factory<_i6.StatsRepository>(
      () => _i6.StatsRepositoryImpl(gh<_i4.Pokedex>()));
  gh.factory<_i7.StatsUseCase>(() => _i7.StatsUseCaseImpl(gh<_i4.Pokedex>()));
  gh.factory<_i8.AboutUseCase>(() => _i8.AboutUseCaseImpl(gh<_i4.Pokedex>()));
  gh.factory<_i9.DetailsUseCase>(
      () => _i9.DetailsUseCaseImpl(gh<_i4.Pokedex>()));
  gh.factory<_i10.EvolutionUseCase>(() => _i10.EvolutionUseCaseImpl(
        gh<_i4.Pokedex>(),
        gh<_i3.EvolutionMapper>(),
      ));
  gh.factory<_i11.PokemonsBloc>(
      () => _i11.PokemonsBloc(gh<_i5.PokemonsUseCase>()));
  gh.factory<_i12.StatsCubit>(() => _i12.StatsCubit(gh<_i7.StatsUseCase>()));
  gh.factory<_i13.AboutCubit>(() => _i13.AboutCubit(gh<_i8.AboutUseCase>()));
  gh.factory<_i14.DetailsCubit>(
      () => _i14.DetailsCubit(gh<_i9.DetailsUseCase>()));
  gh.factory<_i15.EvolutionCubit>(
      () => _i15.EvolutionCubit(gh<_i10.EvolutionUseCase>()));
  return getIt;
}

class _$NetworkModule extends _i16.NetworkModule {}
