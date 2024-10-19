// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pokedex/common/network/di/network_module.dart' as _i813;
import 'package:pokedex/features/pokemon_list/data/pokemon_list_repository.dart'
    as _i1009;
import 'package:pokedex/features/pokemon_list/domain/boundary/pokemon_list_repository.dart'
    as _i977;
import 'package:pokedex/features/pokemon_list/presentation/bloc/pokemon_list_bloc.dart'
    as _i285;

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
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'baseUrl',
  );
  gh.singleton<_i361.Dio>(
      () => networkModule.provideClient(gh<String>(instanceName: 'baseUrl')));
  gh.factory<_i977.PokemonListRepository>(
      () => _i1009.PokemonListRepositoryImpl(dio: gh<_i361.Dio>()));
  gh.factory<_i285.PokemonListBloc>(
      () => _i285.PokemonListBloc(gh<_i977.PokemonListRepository>()));
  return getIt;
}

class _$NetworkModule extends _i813.NetworkModule {}
