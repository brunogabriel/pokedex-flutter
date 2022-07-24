import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseUrl => 'https://pokeapi.co/api/v2';

  @lazySingleton
  Dio provideClient(@Named('BaseUrl') String url) =>
      Dio(BaseOptions(baseUrl: url));
}
