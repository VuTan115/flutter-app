import 'package:flutter/material.dart';
import 'package:goob_by_me/app/pages/loading_page.dart';
import 'package:goob_by_me/app/routes/app_router.dart';
import 'package:goob_by_me/domain/blocs/application/application_bloc.dart';
import 'package:goob_by_me/domain/blocs/components/authentication/authentication_bloc.dart';
import 'package:goob_by_me/domain/models/app_settings.model.dart';
import 'package:logging/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goob_by_me/core/utils/extensions.dart';

class Authenticate extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Logger _logger = Logger('Authenticate');

  Authenticate({Key? key, this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppSettings settings = AppSettings.def();
    if (arguments!.valid() && arguments!['settings']!.valid()) {
      settings = arguments?['settings'] as AppSettings;
    } else {
      ApplicationState applicationState = context.read<ApplicationBloc>().state;
      if (applicationState is ApplicationLoadSuccess) {
        settings = applicationState.settings;
      }
    }
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        // Remove: Save time on loading
        // if (state is AuthenticationInProgress) {
        //   _logger.info('Loading');
        //   _navigator.pushNamedAndRemoveUntil(AppRoute.loadingPage, (Route<dynamic> route) => false);
        // }
        if (state is AuthenticationLoadSuccess) {
          if (state.principal.valid() && state.principal.isAuthenticated) {
            _logger.info('Authenticated');
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.homePage, (Route<dynamic> route) => false,
                arguments: {
                  'settings': settings,
                  'principal': state.principal
                });
          } else {
            _logger.info('Unauthenticated');
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.loginPage, (Route<dynamic> route) => false,
                arguments: {'settings': settings});
            // Test forwarder
            // Navigator.pushNamedAndRemoveUntil(context, AppRoute.forwarder, (Route<dynamic> route) => false, arguments: {'destination': AppRoute.homePage});
          }
        }
        if (state is AuthenticationLoadFailure) {
          _logger.warning('Failure');
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.errorPage, (Route<dynamic> route) => false,
              arguments: {'error': state.error});
        }
      },
      child: LoadingPage(),
    );
  }
}
