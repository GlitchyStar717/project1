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
    apiKey: 'AIzaSyDtS9pkb_Ll6Jk871AuPlY_g_Wa2f0g00w',
    appId: '1:106456108661:web:a68f3ad527d2c47b62f23c',
    messagingSenderId: '106456108661',
    projectId: 'anex-3ec8b',
    authDomain: 'anex-3ec8b.firebaseapp.com',
    storageBucket: 'anex-3ec8b.appspot.com',
    measurementId: 'G-VWMLHDDHZ9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBD-LsyNNuU4PGbFPAGSVN6iObyG9tvCFI',
    appId: '1:106456108661:android:2d28d877ceeff77d62f23c',
    messagingSenderId: '106456108661',
    projectId: 'anex-3ec8b',
    storageBucket: 'anex-3ec8b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpwDoXZ3ZJExr7HPXEP1u9SVcs7h2aWLE',
    appId: '1:106456108661:ios:9dd510308ad30de562f23c',
    messagingSenderId: '106456108661',
    projectId: 'anex-3ec8b',
    storageBucket: 'anex-3ec8b.appspot.com',
    iosClientId: '106456108661-klguacqapgtiu84mp0teu1qkis4d9ruh.apps.googleusercontent.com',
    iosBundleId: 'com.example.anex',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpwDoXZ3ZJExr7HPXEP1u9SVcs7h2aWLE',
    appId: '1:106456108661:ios:9dd510308ad30de562f23c',
    messagingSenderId: '106456108661',
    projectId: 'anex-3ec8b',
    storageBucket: 'anex-3ec8b.appspot.com',
    iosClientId: '106456108661-klguacqapgtiu84mp0teu1qkis4d9ruh.apps.googleusercontent.com',
    iosBundleId: 'com.example.anex',
  );
}