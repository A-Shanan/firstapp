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
    apiKey: 'AIzaSyCanbOFhQ8bz7uH1JMSewCDe8cDrdhOb1M',
    appId: '1:135677862605:web:29cf6d30f036b86117ff84',
    messagingSenderId: '135677862605',
    projectId: 'firstfluttertraining',
    authDomain: 'firstfluttertraining.firebaseapp.com',
    storageBucket: 'firstfluttertraining.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3B24u2PMQhbAiuMDRpFnCAC-pZ1hOyGg',
    appId: '1:135677862605:android:76a9db7c6a0616b617ff84',
    messagingSenderId: '135677862605',
    projectId: 'firstfluttertraining',
    storageBucket: 'firstfluttertraining.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNk003XJCn94oBZip3OM5xXlWFygEpbUo',
    appId: '1:135677862605:ios:a7fbde096833ae2b17ff84',
    messagingSenderId: '135677862605',
    projectId: 'firstfluttertraining',
    storageBucket: 'firstfluttertraining.appspot.com',
    iosClientId: '135677862605-9ddmvv0a1qq67h1b2ujb06cjc7737ov1.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNk003XJCn94oBZip3OM5xXlWFygEpbUo',
    appId: '1:135677862605:ios:a7fbde096833ae2b17ff84',
    messagingSenderId: '135677862605',
    projectId: 'firstfluttertraining',
    storageBucket: 'firstfluttertraining.appspot.com',
    iosClientId: '135677862605-9ddmvv0a1qq67h1b2ujb06cjc7737ov1.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstapp',
  );
}