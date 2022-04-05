import 'package:goob_by_me/core/utils/enumeration.dart';

class Configuration {
  // System
  static bool isDevelopment = true;

  // App
  static const String appKey = 'G-999';
  static const String appTitle = 'Gobid';
  static const String appIosId = 'id0000000000';
  static const String appIosLink = 'https://apps.apple.com/app/$appIosId';

  static const AppMode defaultMode = AppMode.unknown;
  static const String defaultRegion = 'VN';
  static const String defaultLanguage = 'vi';
  static const String defaultTimeZone = 'utc';
  static const int pageTrackingLimited = 12;
  static const int onboardingViewsLimited = 1;

  // Gmaps
  static const String googleApiKey = 'AIzaSyA-RAaYeeOSkoQpqzRs2mLXaTT4x61X4Yo';

  // Services
  static const String graphQLHttpLink = 'https://rickandmortyapi.com/graphql/';
}
