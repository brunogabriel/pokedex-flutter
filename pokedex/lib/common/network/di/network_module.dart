import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('baseUrl')
  @injectable
  String get baseUrl => 'https://pokeapi.co/api/v2/';

  @singleton
  Dio provideClient(
    @Named('baseUrl') String baseUrl,
  ) =>
      Dio(
        BaseOptions(baseUrl: baseUrl),
      );
}
