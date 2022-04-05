import 'package:flutter/material.dart';
import 'package:goob_by_me/app/components/authentication/authenticate.dart';
// import 'package:goob_by_me/app/components/authentication/authenticate.dart';
import 'package:goob_by_me/app/components/navigation/forwarder.dart';
import 'package:goob_by_me/app/pages/blank_page.dart';
import 'package:goob_by_me/app/pages/error_page.dart';
//import 'file:///D:/Work/Projects/Gobid/V4/goob_by_me/lib/app/pages/bk/home_page.dart';
import 'package:goob_by_me/app/pages/main_page.dart';
import 'package:goob_by_me/app/pages/loading_page.dart';
import 'package:goob_by_me/app/pages/login_page.dart';
import 'package:goob_by_me/app/pages/register_page.dart';
import 'package:goob_by_me/app/pages/transport/go_now_page.dart';
import 'package:goob_by_me/app/pages/welcome_page.dart';
import 'package:goob_by_me/core/utils/extensions.dart';

class PageViewTransition<T> extends MaterialPageRoute<T> {
  PageViewTransition({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse)
      return super.buildTransitions(context, animation, secondaryAnimation, child);
    return FadeTransition(opacity: animation, child: child);
  }
}

class AppRoute {
  // For components
  static const String forwarder = '/forwarder';
  static const String authenticate = '/authenticate';

  // For pages
  static const String blankPage = '/';
  static const String loadingPage = '/loading';
  static const String welcomePage = '/welcome';
  static const String loginPage = '/login';
  static const String registerPage = '/register';
  static const String homePage = '/home';
  static const String errorPage = '/error';
  static const String goNowPage = '/goNow';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // For components
      case forwarder:
        return PageViewTransition(
          builder: (_) => Forwarder(
            arguments: RouteExtenion.routeSettingToMap(settings),
          ),
        );
      case authenticate:
        return PageViewTransition(builder: (_) => Authenticate());

      //   // For pages
      case blankPage:
        return PageViewTransition(builder: (_) => LoadingPage());
      case loadingPage:
        return PageViewTransition(builder: (_) => LoadingPage());
      case welcomePage:
        return PageViewTransition(builder: (_) => WelcomePage());
      case loginPage:
        return PageViewTransition(builder: (_) => LoginPage());
      case registerPage:
        return PageViewTransition(builder: (_) => RegisterPage());
      case homePage:
        return PageViewTransition(
            builder: (_) => MainPage(arguments: RouteExtenion.routeSettingToMap(settings)));

      case errorPage:
        return PageViewTransition(
            builder: (_) => ErrorPage(arguments: RouteExtenion.routeSettingToMap(settings)));

      case goNowPage:
        return PageViewTransition(builder: (_) => GoNowPage());

      default:
        return PageViewTransition(builder: (_) => BlankPage());
    }
  }
}
