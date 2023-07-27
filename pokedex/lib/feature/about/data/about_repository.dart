import 'package:injectable/injectable.dart';
import 'package:pokedex/feature/about/data/models/ability.dart';
import 'package:pokedex/feature/about/data/models/about.dart';
import 'package:pokedex/feature/about/data/models/breeding.dart';
import 'package:pokedex/feature/about/data/models/pokedex_data.dart';
import 'package:pokedex/feature/about/data/models/trainning.dart';
import 'package:pokedex/feature/about/data/service/about_service.dart';

abstract class AboutRepository {
  Future<About> getAbout(int number);
}

@Injectable(as: AboutRepository)
class AboutRepositoryImpl implements AboutRepository {
  AboutRepositoryImpl(this._service);

  final AboutService _service;

  @override
  Future<About> getAbout(int number) => _service.getAbout(number);
}
