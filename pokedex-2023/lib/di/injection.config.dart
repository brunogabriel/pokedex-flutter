// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pokedex/pokedex.dart' as _i706;
import 'package:pokedex_flutter/cache/application_cache.dart' as _i801;
import 'package:pokedex_flutter/feature/about/domain/about_use_case.dart'
    as _i112;
import 'package:pokedex_flutter/feature/about/presentation/cubit/about_cubit.dart'
    as _i817;
import 'package:pokedex_flutter/feature/details/domain/details_use_case.dart'
    as _i271;
import 'package:pokedex_flutter/feature/details/presentation/cubit/details_cubit.dart'
    as _i620;
import 'package:pokedex_flutter/feature/evolution/domain/evolution_use_case.dart'
    as _i176;
import 'package:pokedex_flutter/feature/evolution/domain/mapper/evolution_mapper.dart'
    as _i846;
import 'package:pokedex_flutter/feature/evolution/presentation/cubit/evolution_cubit.dart'
    as _i1020;
import 'package:pokedex_flutter/feature/pokemons/domain/pokemons_use_case.dart'
    as _i868;
import 'package:pokedex_flutter/feature/pokemons/presentation/bloc/pokemons_bloc.dart'
    as _i84;
import 'package:pokedex_flutter/feature/search/domain/search_use_case.dart'
    as _i1033;
import 'package:pokedex_flutter/feature/search/presentation/cubit/search_cubit.dart'
    as _i933;
import 'package:pokedex_flutter/feature/stats/domain/stats_use_case.dart'
    as _i1061;
import 'package:pokedex_flutter/feature/stats/presentation/cubit/stats_cubit.dart'
    as _i102;
import 'package:pokedex_flutter/network/network_module.dart' as _i187;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.singleton<_i706.Pokedex>(() => networkModule.pokedex);
  gh.singleton<_i801.ApplicationCache>(() => _i801.MemoryCacheImpl());
  gh.factory<_i868.PokemonsUseCase>(
      () => _i868.PokemonsUseCaseImpl(gh<_i706.Pokedex>()));
  gh.factory<_i1061.StatsUseCase>(
      () => _i1061.StatsUseCaseImpl(gh<_i706.Pokedex>()));
  gh.factory<_i102.StatsCubit>(
      () => _i102.StatsCubit(gh<_i1061.StatsUseCase>()));
  gh.factory<_i84.PokemonsBloc>(
      () => _i84.PokemonsBloc(gh<_i868.PokemonsUseCase>()));
  gh.factory<_i846.EvolutionMapper>(() => _i846.EvolutionMapperImpl());
  gh.factory<_i176.EvolutionUseCase>(() => _i176.EvolutionUseCaseImpl(
        gh<_i706.Pokedex>(),
        gh<_i846.EvolutionMapper>(),
      ));
  gh.factory<_i271.DetailsUseCase>(
      () => _i271.DetailsUseCaseImpl(gh<_i706.Pokedex>()));
  gh.factory<_i620.DetailsCubit>(
      () => _i620.DetailsCubit(gh<_i271.DetailsUseCase>()));
  gh.factory<_i112.AboutUseCase>(
      () => _i112.AboutUseCaseImpl(gh<_i706.Pokedex>()));
  gh.factory<_i1033.SearchUseCase>(() => _i1033.SearchUseCaseImpl(
        gh<_i706.Pokedex>(),
        gh<_i801.ApplicationCache>(),
      ));
  gh.factory<_i1020.EvolutionCubit>(
      () => _i1020.EvolutionCubit(gh<_i176.EvolutionUseCase>()));
  gh.factory<_i817.AboutCubit>(
      () => _i817.AboutCubit(gh<_i112.AboutUseCase>()));
  gh.factory<_i933.SearchCubit>(
      () => _i933.SearchCubit(gh<_i1033.SearchUseCase>()));
  return getIt;
}

class _$NetworkModule extends _i187.NetworkModule {}
