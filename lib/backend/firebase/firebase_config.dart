import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBMYJU5oZJmNLul9cUAJTHR6NOX2Rm_XhM",
            authDomain: "mood2-2385c.firebaseapp.com",
            projectId: "mood2-2385c",
            storageBucket: "mood2-2385c.appspot.com",
            messagingSenderId: "122979272582",
            appId: "1:122979272582:web:57f2337d73393d169ece07"));
  } else {
    await Firebase.initializeApp();
  }
}
