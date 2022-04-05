part of 'application_bloc.dart';

abstract class ApplicationState extends Equatable {
  const ApplicationState();

  @override
  List<Object> get props => [];
}

class ApplicationInitial extends ApplicationState {}

class ApplicationInProgress extends ApplicationState {}

class ApplicationLoadSuccess extends ApplicationState {
  // Members
  final AppSettings settings;

  // Constructors
  const ApplicationLoadSuccess(this.settings);

  @override
  List<Object> get props => [settings];
}

class ApplicationLoadFailure extends ApplicationState {
  // Members
  final dynamic error;

  // Constructors
  const ApplicationLoadFailure(this.error);

  @override
  List<Object> get props => error;
}
