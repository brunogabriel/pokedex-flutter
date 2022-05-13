import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => "https://pokeapi.co/api/v2";

  @lazySingleton
  Dio provideDio(@Named('BaseUrl') String baseUrl) {
    final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(Chuck().getDioInterceptor());
    return dio;
  }
}
