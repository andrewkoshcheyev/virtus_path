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
    apiKey: 'AIzaSyBNnHt3JpH8oJLBk2kCfM6r5uOC14xTrBU',
    appId: '1:194378611204:web:9570347c8319f1abdc1351',
    messagingSenderId: '194378611204',
    projectId: 'virtus-path-dev',
    authDomain: 'virtus-path-dev.firebaseapp.com',
    storageBucket: 'virtus-path-dev.appspot.com',
    measurementId: 'G-R9W0TC48N0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCpge1MuFMj3DwQqvEk9uHnZpTJ7i7Mvak',
    appId: '1:194378611204:android:7981d1cc3be51dd6dc1351',
    messagingSenderId: '194378611204',
    projectId: 'virtus-path-dev',
    storageBucket: 'virtus-path-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfbrRc3QjtIZ-VNw6WK_Sk0G1_Vzfr9Dc',
    appId: '1:194378611204:ios:99dc97965017851ddc1351',
    messagingSenderId: '194378611204',
    projectId: 'virtus-path-dev',
    storageBucket: 'virtus-path-dev.appspot.com',
    iosClientId: '194378611204-eflath255gdcngjd94rtf9qmtthckhdf.apps.googleusercontent.com',
    iosBundleId: 'com.example.virtusPath',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfbrRc3QjtIZ-VNw6WK_Sk0G1_Vzfr9Dc',
    appId: '1:194378611204:ios:99dc97965017851ddc1351',
    messagingSenderId: '194378611204',
    projectId: 'virtus-path-dev',
    storageBucket: 'virtus-path-dev.appspot.com',
    iosClientId: '194378611204-eflath255gdcngjd94rtf9qmtthckhdf.apps.googleusercontent.com',
    iosBundleId: 'com.example.virtusPath',
  );
}
