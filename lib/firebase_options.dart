// import 'package:firebase_core/firebase_core.dart';
//
// class DefaultFirebaseOptions {
//   static FirebaseOptions get currentPlatform {
//     return FirebaseOptions(
//       apiKey: 'ТВОЈ_API_KEY',
//       appId: 'ТВОЈ_APP_ID',
//       messagingSenderId: 'ТВОЈ_SENDER_ID',
//       projectId: 'ТВОЈ_PROJECT_ID',
//       storageBucket: 'ТВОЈ_STORAGE_BUCKET',
//     );
//   }
// import 'package:flutter/material.dart';
//
// import 'firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp());
// }
// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '...',
    appId: '...',
    messagingSenderId: '...',
    projectId: '...',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '...',
    appId: '...',
    messagingSenderId: '...',
    projectId: '...',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: '...',
    appId: '...',
    messagingSenderId: '...',
    projectId: '...',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: '...',
    appId: '...',
    messagingSenderId: '...',
    projectId: '...',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: '...',
    appId: '...',
    messagingSenderId: '...',
    projectId: '...',
  );
}

