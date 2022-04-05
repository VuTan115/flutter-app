import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goob_by_me/core/utils/enumeration.dart';
import 'package:goob_by_me/domain/models/app_settings.model.dart';
import 'package:goob_by_me/domain/repositories/application_repository.dart';
import 'package:goob_by_me/core/utils/extensions.dart';
part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationRepository _applicationRepository;

  // Constructors
  ApplicationBloc({required ApplicationRepository applicationRepository})
      : _applicationRepository = applicationRepository,
        super(ApplicationInitial());

  @override
  Stream<ApplicationState> mapEventToState(
    ApplicationEvent event,
  ) async* {
    try {
      yield ApplicationInProgress();

      AppSettings settings = await _applicationRepository.getAppSettings();

      if (event is ApplicationStarted) {
        print("event: $event");
        if (settings.mode == AppMode.unknown) {
          settings.mode = AppMode.customer;
        }
      }

      if (event is ApplicationChangeSettings) {
        if (event.settings.valid()) {
          settings = await _applicationRepository.setAppSettings(event.settings);
        }
      }

      if (event is ApplicationFactoryReset) {
        await _applicationRepository.clearPreferences();
        settings = await _applicationRepository.getAppSettings();
      }

      yield ApplicationLoadSuccess(settings);
    } catch (error) {
      print("event error");
      yield ApplicationLoadFailure(error);
    }
  }
}
