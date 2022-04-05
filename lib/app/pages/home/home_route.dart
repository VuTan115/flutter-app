import 'package:flutter/material.dart';
import 'package:goob_by_me/app/pages/delivery/notification_view.dart';
import 'package:goob_by_me/app/pages/home/main_view.dart';
import 'package:goob_by_me/app/pages/home/notification_view.dart';
import 'package:goob_by_me/app/pages/home/search_view.dart';
import 'package:goob_by_me/app/utils/variables.dart';

class HomeRoute extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Function callback;

  const HomeRoute({Key? key, this.arguments, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKeys.homeNavigator,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          maintainState: false,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/home/search':
                callback(key: 'home', view: 'search', title: 'Search');
                return SearchView();
              case '/home/notification':
                callback(key: 'home', view: 'notification', title: 'Notification');
                return NotificationView();
              default:
                callback(key: 'home', view: 'main', title: 'Home');
                return MainView();
            }
          },
        );
      },
    );
  }
}
