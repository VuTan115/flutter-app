part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationInProgress extends AuthenticationState {}

class AuthenticationLoadSuccess extends AuthenticationState {
  // Members
  final Principal principal;

  // Constructors
  const AuthenticationLoadSuccess(this.principal);

  @override
  List<Object> get props => [principal];
}

class AuthenticationLoadFailure extends AuthenticationState {
  // Members
  final dynamic error;

  // Constructors
  const AuthenticationLoadFailure(this.error);

  @override
  List<Object> get props => error;
}
