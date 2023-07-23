import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://pokeapi.co/api/v2/';

  @singleton
  Dio provideDio(@Named('BaseUrl') String baseUrl) => Dio(
        BaseOptions(
          baseUrl: baseUrl,
        ),
      )..interceptors.add(PrettyDioLogger(
          responseBody: false,
        ));
}
