import 'dart:async';

import 'package:flutter/material.dart';
import 'package:goob_by_me/app/l10n/messages_all.dart';
import 'package:goob_by_me/app/localizations/resources/string_resources.dart';
import 'package:intl/intl.dart';

class AppLocalizations with StringResources {
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}
