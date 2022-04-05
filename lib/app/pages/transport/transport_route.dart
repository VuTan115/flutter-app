import 'package:flutter/material.dart';
import 'package:goob_by_me/app/pages/transport/main_view.dart';
import 'package:goob_by_me/app/pages/transport/notification_view.dart';
import 'package:goob_by_me/app/pages/transport/search_view.dart';
import 'package:goob_by_me/app/utils/variables.dart';

class TransportRoute extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Function callback;

  const TransportRoute({Key? key, this.arguments, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKeys.transportNavigator,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          maintainState: false,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/transport/search':
                callback(key: 'transport', view: 'search', title: 'Search');
                return SearchView();
              case '/transport/notification':
                callback(key: 'transport', view: 'notification', title: 'Notification');
                return NotificationView();
              default:
                callback(key: 'transport', view: 'main', title: 'Transport');
                return MainView();
            }
          },
        );
      },
    );
  }
}
