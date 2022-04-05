import 'package:flutter/material.dart';
import 'package:goob_by_me/app/localizations/app_localizations.dart';

class St {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}
