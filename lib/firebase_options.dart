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
    apiKey: 'AIzaSyAASmXFGgiWSd-AmPnkHLpmr1yAgRFMcjY',
    appId: '1:156946433541:web:1673f7579443806a3ebe6c',
    messagingSenderId: '156946433541',
    projectId: 'chat-app-2196c',
    authDomain: 'chat-app-2196c.firebaseapp.com',
    storageBucket: 'chat-app-2196c.appspot.com',
    measurementId: 'G-7RVDBRW1XV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7QoFekEATD4z6BrJLZxiI4nIgEM6yuF0',
    appId: '1:156946433541:android:5e30216f3c22474d3ebe6c',
    messagingSenderId: '156946433541',
    projectId: 'chat-app-2196c',
    storageBucket: 'chat-app-2196c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrhIMDy-NaStZD6r2ciTgPTF7o8E4MMN0',
    appId: '1:156946433541:ios:dba45cefc87d3fb53ebe6c',
    messagingSenderId: '156946433541',
    projectId: 'chat-app-2196c',
    storageBucket: 'chat-app-2196c.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrhIMDy-NaStZD6r2ciTgPTF7o8E4MMN0',
    appId: '1:156946433541:ios:2762bf6f84b35f603ebe6c',
    messagingSenderId: '156946433541',
    projectId: 'chat-app-2196c',
    storageBucket: 'chat-app-2196c.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
