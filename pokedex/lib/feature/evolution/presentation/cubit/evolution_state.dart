part of 'evolution_cubit.dart';

abstract class EvolutionState {}

class EvolutionInitialState extends EvolutionState {}

class EvolutionLoadingState extends EvolutionState {}

class EvolutionSuccessState extends EvolutionState {
  EvolutionSuccessState(this.evolution);

  final EvolutionEntity evolution;
}

class EvolutionFailureState extends EvolutionState {}

class NoEvolutionState extends EvolutionState {
  NoEvolutionState(this.pokemon);

  Pokemon pokemon;
}
