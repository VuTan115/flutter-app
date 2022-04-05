import 'package:goob_by_me/core/utils/constance.dart';
import 'package:goob_by_me/domain/models/app_settings.model.dart';
import 'package:goob_by_me/domain/models/principal.model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:goob_by_me/core/utils/utils.dart' show Constance, ObjectExtension;

class SharedPreference {
  // APPLICATION
  Future<bool> setAppSettings(AppSettings settings) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String json = settings.toJsonString();
    return await sharedPreferences.setString(Constance.appSettingsKey, json);
  }

  Future<AppSettings> getAppSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? json = sharedPreferences.getString(Constance.appSettingsKey);
    return (json == null || json.isEmpty) ? AppSettings.def() : AppSettings.fromJsonString(json);
  }

  Future<void> clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  // AUTHENTICATION
  Future<bool> setPrincipal(Principal principal) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String json = principal.toJsonString();
    return await sharedPreferences.setString(Constance.principalKey, json);
  }

  Future<Principal> getPrincipal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? json = sharedPreferences.getString(Constance.principalKey);
    return (json == null || json.isEmpty) ? Principal.def() : Principal.fromJsonString(json);
  }
}
