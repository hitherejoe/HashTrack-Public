import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hash_track/l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({this.firebaseAuth, this.googleSignIn});

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  void _authenticateWithGoogle(BuildContext context) async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final FirebaseUser user = await firebaseAuth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    Navigator.pop(context, user);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 24.0),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Expanded(
            child: new Image.asset('assets/hashtag.png',
                scale: 2.0, width: 48.0, height: 48.0),
            flex: 2,
          ),
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(left: 44.0, right: 44.0),
              child: new Text(
                AppLocalizations.of(context).welcomeMessage,
                textAlign: TextAlign.center,
                style: new TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
            flex: 2,
          ),
          new RaisedButton(
              child: new Text(AppLocalizations.of(context).connectWithGoogle,
                  style: new TextStyle(color: Colors.white)),
              shape: const RoundedRectangleBorder(
                borderRadius:
                    const BorderRadius.all(const Radius.circular(16.0)),
              ),
              color: Colors.blueAccent,
              onPressed: () {
                _authenticateWithGoogle(context);
              }),
        ],
      ),
    ));
  }
}
