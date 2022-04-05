import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show Image;
import 'package:intl/intl.dart';

extension ObjectExtension on Object? {
  bool valid() => this != null;

  bool invalid() => this == null;

  bool isNullOrEmpty() => this == '';

  bool isNullOrFalse() => this == null || this == false;

  bool isNullEmptyOrFalse() => this == null || this == false || this == false;

  bool isNullEmptyZeroOrFalse() =>
      this == null || this == false || this == 0 || this == false;
}

extension IntExtension on int {
  bool valid() => this != null;

  bool invalid() => this == null;

  String toDateTime({String? pattern}) => this != null
      ? DateFormat(pattern ?? 'MM/dd/yyyy')
          .format(DateTime.fromMillisecondsSinceEpoch(this * 1000))
      : this.toString();

  String toDecimalThousand({String? locale}) => this != null
      ? NumberFormat.decimalPattern(locale ?? 'en_US').format(this)
      : this.toString(); //1403 -> 1,403
}

extension StringExtension on String {
  bool valid() => this != null && this != '';

  bool invalid() => this == null || this == '';

  String removeFirstZero() =>
      (this != null && this.length > 0 && this[0] == '0')
          ? this.substring(1)
          : this;

  String capitalizeFirstChar() => (this != null && this.length > 0)
      ? this[0].toUpperCase() + this.substring(1)
      : this;
}

extension ListExtension<T> on List<T> {}

extension ImageExtension on Image {
  Image? fromBase64String(String base64String) =>
      base64String.valid() ? Image.memory(base64Decode(base64String)) : null;
}

extension RouteExtenion on RouteSettings {
  static Map<String, Object> routeSettingToMap(RouteSettings settings) {
    return {
      "name": settings.name!,
      "argument": settings.arguments!,
    };
  }
}
