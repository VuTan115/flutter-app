import 'dart:convert';

import 'package:goob_by_me/core/utils/utils.dart';
import 'package:goob_by_me/domain/models/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_settings.model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppSettings implements Entity {
  String key;
  AppMode mode;
  String region;
  String language;
  String timeZone;
  bool isFirstTime;
  int onboardingViews;

  // Constructors
  AppSettings(
    this.key,
    this.mode, {
    required this.region,
    required this.language,
    required this.timeZone,
    required this.isFirstTime,
    required this.onboardingViews,
  });
  // Initialize default AppSettings
  factory AppSettings.def() => AppSettings(
        Configuration.appKey,
        Configuration.defaultMode,
        region: Configuration.defaultRegion,
        language: Configuration.defaultLanguage,
        timeZone: Configuration.defaultTimeZone,
        isFirstTime: true,
        onboardingViews: 0,
      );

  // Initialize AppSettings with a `Map<String, dynamic>`
  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  // Initialize AppSettings with a json string
  factory AppSettings.fromJsonString(String json) =>
      _$AppSettingsFromJson(jsonDecode(json));

  // Convert AppSettings to a `Map<String, dynamic>`
  @override
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);

  // Convert AppSettings to a json `String`
  @override
  String toJsonString() => jsonEncode(_$AppSettingsToJson(this));

  @override
  AppSettings clone() => _$AppSettingsFromJson(_$AppSettingsToJson(this));

  // Object comparison
  @override
  bool compare(Object other) => identical(this, other);

  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => key.hashCode;

  @override
  String toString() => '{"appSettings": ${this.toJsonString()}}';
}
