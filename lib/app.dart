import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hash_track/l10n/app_localizations.dart';
import 'package:hash_track/l10n/localization_delegate.dart';
import 'package:hash_track/login.dart';
import 'package:hash_track/splash.dart';

class HashtrackApp extends StatelessWidget {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  HashtrackApp({@required this.googleSignIn, @required this.firebaseAuth});

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
      home: _getLandingPage(),
    );
  }

  Widget _getLandingPage() {
    return new StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return new SplashScreen();
          } else {
            return new LoginScreen(googleSignIn: this.googleSignIn);
          }
        }
    );
  }
}
