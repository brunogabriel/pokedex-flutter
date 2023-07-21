import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://pokeapi.co/api/v2/';

  @singleton
  Dio provideDio(@Named('BaseUrl') String baseUrl) => Dio(
        BaseOptions(
          baseUrl: baseUrl,
        ),
      );
}
