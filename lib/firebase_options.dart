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
    apiKey: 'AIzaSyB2jjc-Wy8ySWiQwmWQYUB8ukckVU1zJ-8',
    appId: '1:489742657245:web:4e07a5402a55b78576dd34',
    messagingSenderId: '489742657245',
    projectId: 'grocery-8349c',
    authDomain: 'grocery-8349c.firebaseapp.com',
    storageBucket: 'grocery-8349c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJhujkgBapBChANbCf360EEwaiMGGMW4Y',
    appId: '1:489742657245:android:3250b12d72b9502076dd34',
    messagingSenderId: '489742657245',
    projectId: 'grocery-8349c',
    storageBucket: 'grocery-8349c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6LmUnvCPgH-IarBuKjQnuUE02tQ9OBhk',
    appId: '1:489742657245:ios:6130abbda8d290a876dd34',
    messagingSenderId: '489742657245',
    projectId: 'grocery-8349c',
    storageBucket: 'grocery-8349c.appspot.com',
    iosClientId: '489742657245-s40rb3dicsb9ah33337ju22bd5qeodol.apps.googleusercontent.com',
    iosBundleId: 'com.example.grocery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6LmUnvCPgH-IarBuKjQnuUE02tQ9OBhk',
    appId: '1:489742657245:ios:e03160d1a0b40a6476dd34',
    messagingSenderId: '489742657245',
    projectId: 'grocery-8349c',
    storageBucket: 'grocery-8349c.appspot.com',
    iosClientId: '489742657245-igdgujtf1d59vnu1cjq73ual6kk5u0td.apps.googleusercontent.com',
    iosBundleId: 'com.example.grocery.RunnerTests',
  );
}
