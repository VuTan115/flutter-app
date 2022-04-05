import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goob_by_me/app/pages/welcome_page.dart';
import 'package:goob_by_me/app/routes/app_router.dart';
import 'package:goob_by_me/app/themes/default_theme.dart';
import 'package:goob_by_me/app/utils/variables.dart';
import 'package:goob_by_me/core/utils/configuration.dart';
import 'package:goob_by_me/domain/blocs/application/application_bloc.dart';
import 'package:goob_by_me/domain/blocs/components/authentication/authentication_bloc.dart';
import 'package:goob_by_me/domain/repositories/application_repository.dart';
import 'package:goob_by_me/domain/repositories/authentication_repository.dart';
import 'package:logging/logging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localizations/app_localizations_delegate.dart';

class Application extends StatelessWidget {
  final Logger _logger = Logger('Application');

  NavigatorState get _navigator => GlobalKeys.appNavigator.currentState!;

  @override
  Widget build(BuildContext context) {
    final ApplicationRepository applicationRepository = ApplicationRepository();
    final AuthenticationRepository authenticationRepository = AuthenticationRepository();
    return MultiRepositoryProvider(
      providers: [
        //application bloc
        RepositoryProvider.value(
          value: authenticationRepository,
        ),

        //authentication bloc
        RepositoryProvider.value(
          value: authenticationRepository,
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ApplicationBloc>(
            create: (context) => ApplicationBloc(applicationRepository: applicationRepository)
              ..add(ApplicationStarted()),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(BlocProvider.of<ApplicationBloc>(context),
                authenticationRepository: authenticationRepository)
              ..add(AuthenticationStarted()),
          )
        ],
        child: MaterialApp(
            navigatorKey: GlobalKeys.appNavigator,
            title: Configuration.appTitle.toUpperCase(),
            color: primaryColor,
            theme: buildThemeData(),
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("en", "EN"),
              Locale("vi", "VI"),
            ],
            onGenerateRoute: AppRoute.generateRoute,
            navigatorObservers: <NavigatorObserver>[routeObserver],
            builder: (context, child) {
              return BlocListener<ApplicationBloc, ApplicationState>(
                listener: (context, state) {
                  if (state is ApplicationLoadSuccess) {
                    if (state.settings.isFirstTime ||
                        state.settings.onboardingViews <= Configuration.onboardingViewsLimited) {
                      _logger.info('Onboarding');

                      _navigator.pushNamedAndRemoveUntil(
                          AppRoute.welcomePage, (Route<dynamic> route) => false,
                          arguments: {'settings': state.settings});
                    }
                  }
                  if (state is ApplicationLoadFailure) {
                    _logger.warning('Failure');
                    _navigator.pushNamedAndRemoveUntil(
                        AppRoute.errorPage, (Route<dynamic> route) => false,
                        arguments: {'error': state.error});
                  }
                },
                child: child,
              );
            }),
      ),
    );
  }
}
