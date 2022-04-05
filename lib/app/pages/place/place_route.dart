import 'package:flutter/material.dart';
import 'package:goob_by_me/app/pages/delivery/main_view.dart';
import 'package:goob_by_me/app/pages/place/main_view.dart';
import 'package:goob_by_me/app/pages/place/notification_view.dart';
import 'package:goob_by_me/app/pages/place/search_view.dart';
import 'package:goob_by_me/app/utils/variables.dart';

class PlaceRoute extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Function callback;

  const PlaceRoute({Key? key, this.arguments, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKeys.placeNavigator,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          maintainState: false,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/place/search':
                callback(key: 'place', view: 'search', title: 'Search');
                return SearchView();
              case '/place/notification':
                callback(key: 'place', view: 'notification', title: 'Notification');
                return NotificationView();
              default:
                callback(key: 'place', view: 'main', title: 'Place');
                return MainView();
            }
          },
        );
      },
    );
  }
}
