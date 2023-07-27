import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AboutService {}

@Injectable(as: AboutService)
class AboutServiceImpl extends AboutService {
  AboutServiceImpl(this._dio);

  final Dio _dio;
}
