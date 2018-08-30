import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hash_track/l10n/app_localizations.dart';

class TranslationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}