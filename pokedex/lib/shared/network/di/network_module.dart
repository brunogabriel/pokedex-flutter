import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://pokeapi.co/api/v2';

  @Named('ChuckerInterceptor')
  Interceptor get chuckerInterceptor => ChuckerDioInterceptor();

  @lazySingleton
  Dio provideClient(@Named('BaseUrl') String url,
          @Named('ChuckerInterceptor') Interceptor chuckerInterceptor) =>
      Dio(BaseOptions(baseUrl: url))..interceptors.add(chuckerInterceptor);
}
