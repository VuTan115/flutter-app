import 'package:flutter/material.dart';
import 'package:goob_by_me/app/pages/trade/main_view.dart';
import 'package:goob_by_me/app/pages/trade/notification_view.dart';
import 'package:goob_by_me/app/pages/trade/search_view.dart';
import 'package:goob_by_me/app/utils/variables.dart';

class TradeRoute extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Function callback;

  const TradeRoute({Key? key, this.arguments, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKeys.tradeNavigator,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          maintainState: false,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/trade/search':
                callback(key: 'trade', view: 'search', title: 'Search');
                return SearchView();
              case '/trade/notification':
                callback(key: 'trade', view: 'notification', title: 'Notification');
                return NotificationView();
              default:
                callback(key: 'trade', view: 'main', title: 'Trade');
                return MainView();
            }
          },
        );
      },
    );
  }
}
