part of 'stats_cubit.dart';

abstract class StatsState {}

class StatsInitialState extends StatsState {}

class StatsLoadingState extends StatsState {}

class StatsFailureState extends StatsState {}

class StatsSuccessState extends StatsState {
  StatsSuccessState(this.data);

  final StatsEntity data;
}
