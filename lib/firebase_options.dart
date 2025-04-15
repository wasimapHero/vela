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
    apiKey: 'AIzaSyB2Sb54PLVpMx2-azr4X0WR_CYvI1gn8Ic',
    appId: '1:206741722944:web:4cff84d20c1dde80c34ca5',
    messagingSenderId: '206741722944',
    projectId: 'test-app-60cf7',
    authDomain: 'test-app-60cf7.firebaseapp.com',
    storageBucket: 'test-app-60cf7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_mtZzENTqvKP8-QXCGrGC7v0vICQMeM0',
    appId: '1:206741722944:android:7a14ca9157a09ae1c34ca5',
    messagingSenderId: '206741722944',
    projectId: 'test-app-60cf7',
    storageBucket: 'test-app-60cf7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATo_Z3BQea_ed4T8g-3v8KkPe_lEAWaCI',
    appId: '1:206741722944:ios:c330abf47c3a250dc34ca5',
    messagingSenderId: '206741722944',
    projectId: 'test-app-60cf7',
    storageBucket: 'test-app-60cf7.appspot.com',
    iosClientId: '206741722944-thpcv3l03hvatej3j3efjao5gdrqjvu3.apps.googleusercontent.com',
    iosBundleId: 'com.example.testApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyATo_Z3BQea_ed4T8g-3v8KkPe_lEAWaCI',
    appId: '1:206741722944:ios:aee1a389400f7075c34ca5',
    messagingSenderId: '206741722944',
    projectId: 'test-app-60cf7',
    storageBucket: 'test-app-60cf7.appspot.com',
    iosClientId: '206741722944-9dmj9ds5t2cqh13bbt5kj15ilhkq5moc.apps.googleusercontent.com',
    iosBundleId: 'com.example.testApp.RunnerTests',
  );
}
