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
    apiKey: 'AIzaSyCMZawKR5229rxU_xS08OfIcKqzAKZbYwc',
    appId: '1:427577979545:web:b8ee0f7f5fc0c8693c7e08',
    messagingSenderId: '427577979545',
    projectId: 'deudorz',
    authDomain: 'deudorz.firebaseapp.com',
    storageBucket: 'deudorz.appspot.com',
    measurementId: 'G-QSNFB5ZXQQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIK7zswV2xsn88MqE6lirJQ9Z76I1Xdyw',
    appId: '1:427577979545:android:37f5ef7e789f69983c7e08',
    messagingSenderId: '427577979545',
    projectId: 'deudorz',
    storageBucket: 'deudorz.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPIBqz9XcqxOjDSdEjg5QaQMATc1kF6oA',
    appId: '1:427577979545:ios:8b57ff0506d8569d3c7e08',
    messagingSenderId: '427577979545',
    projectId: 'deudorz',
    storageBucket: 'deudorz.appspot.com',
    iosBundleId: 'com.jpdev.deudoors',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPIBqz9XcqxOjDSdEjg5QaQMATc1kF6oA',
    appId: '1:427577979545:ios:578777d3eb643b3d3c7e08',
    messagingSenderId: '427577979545',
    projectId: 'deudorz',
    storageBucket: 'deudorz.appspot.com',
    iosBundleId: 'com.jpdev.deudoors.RunnerTests',
  );
}
