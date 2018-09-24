import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hash_track/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class AppLocalizations {

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);


  String get applicationTitle =>
      Intl.message('HashTrack',
          name: 'applicationTitle', desc: 'The application title');

  String get connectWithGoogle =>
      Intl.message('Connect with Google',
          name: 'connectWithGoogle', desc: 'Connect with Google button text');

  String get welcomeMessage =>
      Intl.message('Connect with your Google account to keep track of your favorite hashtags for Twitter & Instagram',
          name: 'welcomeMessage', desc: 'Welcome text displayed on authentication screen');

}
