part of 'about_cubit.dart';

abstract class AboutState {}

class AboutInitialState extends AboutState {}

class AboutLoadingState extends AboutState {}

class AboutSuccessState extends AboutState {
  AboutSuccessState(this.about);

  final About about;
}

class AboutFailureState extends AboutState {}
