import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/about/data/service/about_service.dart';

abstract class AboutRepository {}

@Injectable(as: AboutRepository)
class AboutRepositoryImpl implements AboutRepository {
  AboutRepositoryImpl(this._service);

  final AboutService _service;
}
