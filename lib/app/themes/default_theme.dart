import 'package:flutter/material.dart';

final normalTheme = ThemeData(
  // This is the theme of your application.
  //
  // Try running your application with "flutter run". You'll see the
  // application has a blue toolbar. Then, without quitting the app, try
  // changing the primarySwatch below to Colors.green and then invoke
  // "hot reload" (press "r" in the console where you ran "flutter run",
  // or simply save your changes to "hot reload" in a Flutter IDE).
  // Notice that the counter didn't reset back to zero; the application
  // is not restarted.
  primarySwatch: Colors.blue,
  // This makes the visual density adapt to the platform that you run
  // the app on. For desktop platforms, the controls will be smaller and
  // closer together (more dense) than on mobile platforms.
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

ThemeData buildThemeData() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    colorScheme: _buildColorScheme(base.colorScheme),
    bottomNavigationBarTheme:
        _bottomNavigationBarThemeData(base.bottomNavigationBarTheme),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base;
//      .copyWith(
//        button: base.button.copyWith(
//          fontSize: 14,
//        ),
//      )
//      .apply(fontFamily: 'Rubik');
}

ColorScheme _buildColorScheme(ColorScheme base) {
  return base.copyWith(
    primary: const Color(0xff6200ee),
    primaryVariant: const Color(0xff3700b3),
    secondary: const Color(0xff03dac6),
    secondaryVariant: const Color(0xff018786),
    surface: Colors.white,
    background: Colors.white,
    error: const Color(0xffb00020),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );
}

BottomNavigationBarThemeData _bottomNavigationBarThemeData(
    BottomNavigationBarThemeData base) {
  return base.copyWith(
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    selectedItemColor: Colors.blue,
    // selectedIconTheme: IconThemeData(size: 28, opacity: 1.0),
    selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    unselectedItemColor: Colors.black87,
    // unselectedIconTheme: IconThemeData(size: 22, opacity: 0.6),
    unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  );
}

const Duration defaultDuration = Duration(milliseconds: 100);

const Color primaryColor = Color.fromRGBO(70, 120, 150, 1.0);

const Color homeColor = Color.fromRGBO(70, 120, 150, 1.0);
const Color transportColor = Color.fromRGBO(70, 120, 150, 1.0);
const Color tradeColor = Color.fromRGBO(70, 120, 150, 1.0);
const Color placeColor = Color.fromRGBO(70, 120, 150, 1.0);
const Color deliveryColor = Color.fromRGBO(70, 120, 150, 1.0);
const Color paymentColor = Color.fromRGBO(70, 120, 150, 1.0);
const Color userColor = Color.fromRGBO(70, 120, 150, 1.0);
