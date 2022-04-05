import 'package:pedantic/pedantic.dart';

import 'package:goob_by_me/core/utils/configuration.dart';
import 'package:goob_by_me/device/storage/shared_preference.dart';
import 'package:goob_by_me/domain/models/app_settings.model.dart';
import 'package:goob_by_me/domain/repositories/exceptions/application_exception.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationRepository {
  // Members
  final Logger _logger = Logger('ApplicationRepository');
  final SharedPreference _sharedPreference = SharedPreference();

  // Singleton object of `ApplicationRepository`
  static ApplicationRepository _instance = ApplicationRepository._internal();

  // Constructors
  ApplicationRepository._internal();

  factory ApplicationRepository() => _instance;
  //set app default mode
  Future<AppSettings> setAppSettings(AppSettings settings) async {
    try {
      return await _sharedPreference.setAppSettings(settings) ? settings : AppSettings.def();
    } on Exception {
      throw SetAppSettingsFailure();
    }
  }

  //get app setting
  Future<AppSettings> getAppSettings() async {
    try {
      AppSettings settings = await _sharedPreference.getAppSettings();
      AppSettings currentSettings = settings.clone();

      if (settings.isFirstTime || settings.onboardingViews < Configuration.onboardingViewsLimited) {
        if (settings.isFirstTime) settings.isFirstTime = false;
        if (settings.onboardingViews < Configuration.onboardingViewsLimited)
          settings.onboardingViews++;
        unawaited(setAppSettings(settings));
      }

      return currentSettings;
    } on Exception {
      throw GetAppSettingsFailure();
    }
  }

  Future<void> clearPreferences() async {
    try {
      await _sharedPreference.clear();
    } on Exception {
      throw ClearPreferencesFailure();
    }
  }
}
