import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hash_track/app.dart';

Future<void> main() async {

  runApp(new HashtrackApp(
    googleSignIn: new GoogleSignIn(),
    firebaseAuth: FirebaseAuth.instance,
  ));
}
