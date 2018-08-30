import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hash_track/l10n/app_localizations.dart';
import 'package:hash_track/l10n/localization_delegate.dart';

class HashtrackApp extends StatelessWidget {
  HashtrackApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).applicationTitle,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        new TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        const Locale('en', ''),
      ],
    );
  }
}
