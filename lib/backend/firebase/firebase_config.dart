import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCNli_uC0btP5ZGwJ8Ong_HOoCyCJhZtFM",
            authDomain: "chilli-mood.firebaseapp.com",
            projectId: "chilli-mood",
            storageBucket: "chilli-mood.appspot.com",
            messagingSenderId: "621326008314",
            appId: "1:621326008314:web:8c49bd8bd557c57732ee43",
            measurementId: "G-BDGHNQF8SS"));
  } else {
    await Firebase.initializeApp();
  }
}
