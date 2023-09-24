// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
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
    apiKey: 'AIzaSyCF6WmK99vCq3bpLBq56HipzCTsvZxNJtk',
    appId: '1:634653708507:web:bf59aedcd2cb3fd9acfcfe',
    messagingSenderId: '634653708507',
    projectId: 'asahi-todo-dev',
    authDomain: 'asahi-todo-dev.firebaseapp.com',
    storageBucket: 'asahi-todo-dev.appspot.com',
    measurementId: 'G-63C3S9PR0B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgyDKCTMh_pYwY72w6t6kB45dX0uezxIo',
    appId: '1:634653708507:android:d6a73909243cbc8bacfcfe',
    messagingSenderId: '634653708507',
    projectId: 'asahi-todo-dev',
    storageBucket: 'asahi-todo-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaS6UjiluXBMdlEAL4lqOR-BLjJPDLZJA',
    appId: '1:634653708507:ios:81cfaad3731a1a6facfcfe',
    messagingSenderId: '634653708507',
    projectId: 'asahi-todo-dev',
    storageBucket: 'asahi-todo-dev.appspot.com',
    iosBundleId: 'com.example.asahiTodo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDaS6UjiluXBMdlEAL4lqOR-BLjJPDLZJA',
    appId: '1:634653708507:ios:9560248136f1e92eacfcfe',
    messagingSenderId: '634653708507',
    projectId: 'asahi-todo-dev',
    storageBucket: 'asahi-todo-dev.appspot.com',
    iosBundleId: 'com.example.asahiTodo.RunnerTests',
  );
}