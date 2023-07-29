import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/stats/data/models/stats_data.dart';
import 'package:pokedex_flutter/feature/stats/data/stats_repository.dart';

part 'stats_state.dart';

@injectable
class StatsCubit extends Cubit<StatsState> {
  StatsCubit(this._repository) : super(StatsInitialState());

  final StatsRepository _repository;

  void getStats(Pokemon pokemon) async {
    emit(StatsLoadingState());
    try {
      final data = await _repository.getStats(pokemon);
      emit(StatsSuccessState(data));
    } catch (_) {
      emit(StatsFailureState());
    }
  }
}
