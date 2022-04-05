part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationChangePrincipal extends AuthenticationEvent {
  // Members
  final Principal principal;

  // Constructors
  const AuthenticationChangePrincipal(this.principal);

  @override
  List<Object> get props => [principal];
}
