import 'package:flutter/material.dart';
import 'package:goob_by_me/app/pages/delivery/main_view.dart';
import 'package:goob_by_me/app/pages/delivery/notification_view.dart';
import 'package:goob_by_me/app/pages/delivery/search_view.dart';
import 'package:goob_by_me/app/utils/variables.dart';

class DeliveryRoute extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Function callback;

  const DeliveryRoute({Key? key, this.arguments, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKeys.deliveryNavigator,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          maintainState: false,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/delivery/search':
                callback(key: 'delivery', view: 'search', title: 'Search');
                return SearchView();
              case '/delivery/notification':
                callback(key: 'delivery', view: 'notification', title: 'Notification');
                return NotificationView();
              default:
                callback(key: 'delivery', view: 'main', title: 'Delivery');
                return MainView();
            }
          },
        );
      },
    );
  }
}
