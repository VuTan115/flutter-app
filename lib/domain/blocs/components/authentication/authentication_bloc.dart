import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goob_by_me/domain/blocs/application/application_bloc.dart';
import 'package:goob_by_me/domain/models/principal.model.dart';
import 'package:goob_by_me/domain/repositories/authentication_repository.dart';
import 'package:goob_by_me/core/utils/extensions.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  // Members
  final AuthenticationRepository _authenticationRepository;
  final ApplicationBloc applicationBloc;
  StreamSubscription? applicationSubscription;

  // Constructors
  AuthenticationBloc(this.applicationBloc,
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AuthenticationInitial()) {
    applicationSubscription = applicationBloc.stream.listen((state) {
      if (state is ApplicationFactoryReset) {
        add(AuthenticationChangePrincipal(Principal.def()));
      }
    });
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    try {
      yield AuthenticationInProgress();

      Principal principal = await _authenticationRepository.getPrincipal();

      if (event is AuthenticationStarted) {}

      if (event is AuthenticationChangePrincipal) {
        if (event.principal.valid()) {
          principal = await _authenticationRepository.setPrincipal(event.principal);
        }
      }

      yield AuthenticationLoadSuccess(principal);
    } catch (error) {
      yield AuthenticationLoadFailure(error);
    }
  }
}
