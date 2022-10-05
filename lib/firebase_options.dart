// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart'
    show FirebaseOptions;
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
    apiKey: 'AIzaSyDDMNozT9l23uvqGnpQPKNx54Epc9_dFsw',
    appId: '1:910138462776:web:ab8dc58912aa12cfda0ccd',
    messagingSenderId: '910138462776',
    projectId: 'tss-trova-servizi-salerno',
    authDomain: 'tss-trova-servizi-salerno.firebaseapp.com',
    storageBucket: 'tss-trova-servizi-salerno.appspot.com',
    measurementId: 'G-7JDKS9C80P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhltrmn7UAFBg1NCWk82J6-MZwG0lf8I8',
    appId: '1:910138462776:android:6ef6043a034752f1da0ccd',
    messagingSenderId: '910138462776',
    projectId: 'tss-trova-servizi-salerno',
    storageBucket: 'tss-trova-servizi-salerno.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDrRA-9GdIE0K-0pjxpqjAzOkV8xpJpsWE',
    appId: '1:910138462776:ios:2424cabbb983b681da0ccd',
    messagingSenderId: '910138462776',
    projectId: 'tss-trova-servizi-salerno',
    storageBucket: 'tss-trova-servizi-salerno.appspot.com',
    iosClientId: '910138462776-4prtpc2hn653674q0mr7jqap315v6emq.apps.googleusercontent.com',
    iosBundleId: 'com.example.appSalerno',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDrRA-9GdIE0K-0pjxpqjAzOkV8xpJpsWE',
    appId: '1:910138462776:ios:2424cabbb983b681da0ccd',
    messagingSenderId: '910138462776',
    projectId: 'tss-trova-servizi-salerno',
    storageBucket: 'tss-trova-servizi-salerno.appspot.com',
    iosClientId: '910138462776-4prtpc2hn653674q0mr7jqap315v6emq.apps.googleusercontent.com',
    iosBundleId: 'com.example.appSalerno',
  );
}
