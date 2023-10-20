import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAam24-ZZaaDPZ86jUJm9SA4n0lt7rYoEg",
            authDomain: "vetcare-6a67d.firebaseapp.com",
            projectId: "vetcare-6a67d",
            storageBucket: "vetcare-6a67d.appspot.com",
            messagingSenderId: "960640225165",
            appId: "1:960640225165:web:4583ddf53793b2472d77c4",
            measurementId: "G-065RRRXKE0"));
  } else {
    await Firebase.initializeApp();
  }
}
