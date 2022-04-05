part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object> get props => [];
}

class ApplicationStarted extends ApplicationEvent {}

class ApplicationChangeSettings extends ApplicationEvent {
  // Members
  final AppSettings settings;

  // Constructors
  const ApplicationChangeSettings(this.settings);

  @override
  List<Object> get props => [settings];
}

class ApplicationFactoryReset extends ApplicationEvent {}
