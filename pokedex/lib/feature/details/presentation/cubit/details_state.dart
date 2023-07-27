part of 'details_cubit.dart';

abstract class DetailsState {}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsSuccessState extends DetailsState {
  DetailsSuccessState(this.pokemon);

  final Pokemon pokemon;
}

class DetailsFailureState extends DetailsState {}
