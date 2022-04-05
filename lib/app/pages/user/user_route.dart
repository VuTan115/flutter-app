import 'package:flutter/material.dart';
import 'package:goob_by_me/app/pages/home/main_view.dart';
import 'package:goob_by_me/app/pages/home/notification_view.dart';
import 'package:goob_by_me/app/pages/home/search_view.dart';
import 'package:goob_by_me/app/utils/variables.dart';

import 'notification_view.dart';

class UserRoute extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Function callback;

  const UserRoute({Key? key, this.arguments, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKeys.userNavigator,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          maintainState: false,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/user/search':
                callback(key: 'user', view: 'search', title: 'Search');
                return SearchView();
              case '/user/notification':
                callback(key: 'user', view: 'notification', title: 'Notification');
                return NotificationView();
              default:
                callback(key: 'user', view: 'main', title: 'User');
                return MainView();
            }
          },
        );
      },
    );
  }
}
