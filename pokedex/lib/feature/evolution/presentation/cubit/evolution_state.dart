part of 'evolution_cubit.dart';

abstract class EvolutionState {}

class EvolutionInitialState extends EvolutionState {}

class EvolutionLoadingState extends EvolutionState {}

class EvolutionSuccessState extends EvolutionState {
  EvolutionSuccessState(this.evolutions);

  final List<ChainLink> evolutions;
}

class EvolutionFailureState extends EvolutionState {}
