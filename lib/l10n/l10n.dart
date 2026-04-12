import 'package:alfaresi/l10n/app_localizations.dart';
import 'package:flutter/material.dart'
    show BuildContext, Locale, LocalizationsDelegate;
import 'package:flutter_localizations/flutter_localizations.dart';

class L10n {
  static final all = [
    const Locale('en', "English"),
    const Locale('ar', "Arabic"),
  ];

  static List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    AppLocalizations.delegate,
  ];
}

extension AppLocalizationX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
