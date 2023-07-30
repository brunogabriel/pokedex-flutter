import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/pokedex.dart';
import 'package:pokedex_flutter/feature/stats/domain/entities/stats_entity.dart';
import 'package:pokedex_flutter/feature/stats/domain/stats_use_case.dart';

part 'stats_state.dart';

@injectable
class StatsCubit extends Cubit<StatsState> {
  StatsCubit(this._useCase) : super(StatsInitialState());

  final StatsUseCase _useCase;

  void getStats(Pokemon pokemon) async {
    emit(StatsLoadingState());
    try {
      final data = await _useCase.getStats(pokemon);
      emit(StatsSuccessState(data));
    } catch (_) {
      emit(StatsFailureState());
    }
  }
}
