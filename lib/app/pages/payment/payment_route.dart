import 'package:flutter/material.dart';
import 'package:goob_by_me/app/pages/payment/main_view.dart';
import 'package:goob_by_me/app/pages/payment/notification_view.dart';
import 'package:goob_by_me/app/pages/payment/search_view.dart';
import 'package:goob_by_me/app/utils/variables.dart';

class PaymentRoute extends StatelessWidget {
  final Map<String, Object>? arguments;
  final Function callback;

  const PaymentRoute({Key? key, this.arguments, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalKeys.paymentNavigator,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          maintainState: false,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/payment/search':
                callback(key: 'payment', view: 'search', title: 'Search');
                return SearchView();
              case '/payment/notification':
                callback(key: 'payment', view: 'notification', title: 'Notification');
                return NotificationView();
              default:
                callback(key: 'payment', view: 'main', title: 'Payment');
                return MainView();
            }
          },
        );
      },
    );
  }
}
