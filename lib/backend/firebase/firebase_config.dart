import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDLluGApGqRmFV-s052xmKul2Lb0c9QwSE",
            authDomain: "airbnb-template-22d40.firebaseapp.com",
            projectId: "airbnb-template-22d40",
            storageBucket: "airbnb-template-22d40.appspot.com",
            messagingSenderId: "500408481133",
            appId: "1:500408481133:web:e9c69098a3acee54fed664"));
  } else {
    await Firebase.initializeApp();
  }
}
