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
import 'package:pokedex/pokedex.dart' as _i5;
import 'package:pokedex_flutter/cache/application_cache.dart' as _i3;
import 'package:pokedex_flutter/feature/about/domain/about_use_case.dart'
    as _i10;
import 'package:pokedex_flutter/feature/about/presentation/cubit/about_cubit.dart'
    as _i16;
import 'package:pokedex_flutter/feature/details/domain/details_use_case.dart'
    as _i11;
import 'package:pokedex_flutter/feature/details/presentation/cubit/details_cubit.dart'
    as _i17;
import 'package:pokedex_flutter/feature/evolution/domain/evolution_use_case.dart'
    as _i12;
import 'package:pokedex_flutter/feature/evolution/domain/mapper/evolution_mapper.dart'
    as _i4;
import 'package:pokedex_flutter/feature/evolution/presentation/cubit/evolution_cubit.dart'
    as _i18;
import 'package:pokedex_flutter/feature/pokemons/domain/pokemons_use_case.dart'
    as _i6;
import 'package:pokedex_flutter/feature/pokemons/presentation/bloc/pokemons_bloc.dart'
    as _i13;
import 'package:pokedex_flutter/feature/search/domain/search_use_case.dart'
    as _i7;
import 'package:pokedex_flutter/feature/search/presentation/cubit/search_cubit.dart'
    as _i14;
import 'package:pokedex_flutter/feature/stats/data/stats_repository.dart'
    as _i8;
import 'package:pokedex_flutter/feature/stats/domain/stats_use_case.dart'
    as _i9;
import 'package:pokedex_flutter/feature/stats/presentation/cubit/stats_cubit.dart'
    as _i15;
import 'package:pokedex_flutter/network/network_module.dart' as _i19;

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
  gh.singleton<_i3.ApplicationCache>(_i3.MemoryCacheImpl());
  gh.factory<_i4.EvolutionMapper>(() => _i4.EvolutionMapperImpl());
  gh.singleton<_i5.Pokedex>(networkModule.pokedex);
  gh.factory<_i6.PokemonsUseCase>(
      () => _i6.PokemonsUseCaseImpl(gh<_i5.Pokedex>()));
  gh.factory<_i7.SearchUseCase>(() => _i7.SearchUseCaseImpl(
        gh<_i5.Pokedex>(),
        gh<_i3.ApplicationCache>(),
      ));
  gh.factory<_i8.StatsRepository>(
      () => _i8.StatsRepositoryImpl(gh<_i5.Pokedex>()));
  gh.factory<_i9.StatsUseCase>(() => _i9.StatsUseCaseImpl(gh<_i5.Pokedex>()));
  gh.factory<_i10.AboutUseCase>(() => _i10.AboutUseCaseImpl(gh<_i5.Pokedex>()));
  gh.factory<_i11.DetailsUseCase>(
      () => _i11.DetailsUseCaseImpl(gh<_i5.Pokedex>()));
  gh.factory<_i12.EvolutionUseCase>(() => _i12.EvolutionUseCaseImpl(
        gh<_i5.Pokedex>(),
        gh<_i4.EvolutionMapper>(),
      ));
  gh.factory<_i13.PokemonsBloc>(
      () => _i13.PokemonsBloc(gh<_i6.PokemonsUseCase>()));
  gh.factory<_i14.SearchCubit>(() => _i14.SearchCubit(gh<_i7.SearchUseCase>()));
  gh.factory<_i15.StatsCubit>(() => _i15.StatsCubit(gh<_i9.StatsUseCase>()));
  gh.factory<_i16.AboutCubit>(() => _i16.AboutCubit(gh<_i10.AboutUseCase>()));
  gh.factory<_i17.DetailsCubit>(
      () => _i17.DetailsCubit(gh<_i11.DetailsUseCase>()));
  gh.factory<_i18.EvolutionCubit>(
      () => _i18.EvolutionCubit(gh<_i12.EvolutionUseCase>()));
  return getIt;
}

class _$NetworkModule extends _i19.NetworkModule {}
