// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA6iE_qPfHPO-_LMee-d3a_7dypwt07hX8',
    appId: '1:468915066834:web:9edcc23a510446d013da0b',
    messagingSenderId: '468915066834',
    projectId: 'ideahacks2023-b62a6',
    authDomain: 'ideahacks2023-b62a6.firebaseapp.com',
    databaseURL: 'https://ideahacks2023-b62a6-default-rtdb.firebaseio.com',
    storageBucket: 'ideahacks2023-b62a6.appspot.com',
    measurementId: 'G-YJL1RE3H5B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDapXkLZ0WWkArb5GNiz3BKefy88yEESpY',
    appId: '1:468915066834:android:0a1636eeb77a1e9613da0b',
    messagingSenderId: '468915066834',
    projectId: 'ideahacks2023-b62a6',
    databaseURL: 'https://ideahacks2023-b62a6-default-rtdb.firebaseio.com',
    storageBucket: 'ideahacks2023-b62a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVmUg2m_AyMbGhE97dQtDPExq0oKQBNwo',
    appId: '1:468915066834:ios:a331a6b76f2cc45913da0b',
    messagingSenderId: '468915066834',
    projectId: 'ideahacks2023-b62a6',
    databaseURL: 'https://ideahacks2023-b62a6-default-rtdb.firebaseio.com',
    storageBucket: 'ideahacks2023-b62a6.appspot.com',
    iosClientId: '468915066834-r4i5orf2ghhmo2138vh9u7mmsl0oeso5.apps.googleusercontent.com',
    iosBundleId: 'com.example.lahacks2023',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVmUg2m_AyMbGhE97dQtDPExq0oKQBNwo',
    appId: '1:468915066834:ios:df73dff1ef00296a13da0b',
    messagingSenderId: '468915066834',
    projectId: 'ideahacks2023-b62a6',
    databaseURL: 'https://ideahacks2023-b62a6-default-rtdb.firebaseio.com',
    storageBucket: 'ideahacks2023-b62a6.appspot.com',
    iosClientId: '468915066834-aoh657mlfkj9bi2vopmis8l1t0iug0li.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo1',
  );
}
