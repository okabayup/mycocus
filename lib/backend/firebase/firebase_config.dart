import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAhbr1Cn-IwSqeWc7LRRP3i5j9LaiNicSE",
            authDomain: "cocus-2023.firebaseapp.com",
            projectId: "cocus-2023",
            storageBucket: "cocus-2023.appspot.com",
            messagingSenderId: "689981005654",
            appId: "1:689981005654:web:200fc2c7391f8ace7340f7",
            measurementId: "G-99EJ6E5HMJ"));
  } else {
    await Firebase.initializeApp();
  }
}
