import 'package:flutter/material.dart';

export 'package:goob_by_me/domain/models/app_settings.model.dart';
export 'package:goob_by_me/domain/models/credential.model.dart';
export 'package:goob_by_me/domain/models/principal.model.dart';
export 'package:goob_by_me/domain/models/user.model.dart';
export 'package:goob_by_me/domain/models/user_profile.model.dart';

class MainView {
  String? key;
  String view;
  String title;
  Widget widget;
  IconData? icon;
  Color? color;

  MainView(this.key, this.view, this.title, this.widget, {this.icon, this.color});
}
