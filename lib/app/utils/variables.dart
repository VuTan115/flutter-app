import 'package:flutter/material.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class GlobalKeys {
  // Used for MainPage Scaffold
  static final GlobalKey<ScaffoldState> mainScaffold =
      GlobalKey<ScaffoldState>();

  // Used for MaterialApp, coordinated by AppRoute
  static final GlobalKey<NavigatorState> appNavigator =
      GlobalKey<NavigatorState>();

  // Used for HomePage, coordinated by HomePage Navigator
  static final GlobalKey<NavigatorState> homeNavigator =
      GlobalKey<NavigatorState>();

  // Used for TransportPage, coordinated by TransportPage Navigator
  static final GlobalKey<NavigatorState> transportNavigator =
      GlobalKey<NavigatorState>();

  // Used for TradePage, coordinated by TradePage Navigator
  static final GlobalKey<NavigatorState> tradeNavigator =
      GlobalKey<NavigatorState>();

  // Used for DeliveryPage, coordinated by DeliveryPage Navigator
  static final GlobalKey<NavigatorState> deliveryNavigator =
      GlobalKey<NavigatorState>();

  // Used for PlacePage, coordinated by PlacePage Navigator
  static final GlobalKey<NavigatorState> placeNavigator =
      GlobalKey<NavigatorState>();

  // Used for PaymentPage, coordinated by PaymentPage Navigator
  static final GlobalKey<NavigatorState> paymentNavigator =
      GlobalKey<NavigatorState>();

  // Used for UserPage, coordinated by UserPage Navigator
  static final GlobalKey<NavigatorState> userNavigator =
      GlobalKey<NavigatorState>();
}
