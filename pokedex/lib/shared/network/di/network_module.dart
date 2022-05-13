import 'package:chuck_interceptor/chuck.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => "https://pokeapi.co/api/v2";

  @lazySingleton
  Chuck providesChuck() => Chuck(showNotification: true);

  @lazySingleton
  Dio provideDio(@Named('BaseUrl') String baseUrl, Chuck chuck) {
    final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(chuck.getDioInterceptor());
    return dio;
  }
}
