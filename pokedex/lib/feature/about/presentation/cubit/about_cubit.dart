import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/feature/about/data/about_repository.dart';

part 'about_state.dart';

@injectable
class AboutCubit extends Cubit<AboutState> {
  AboutCubit(this._repository) : super(AboutInitial());
  final AboutRepository _repository;
}
