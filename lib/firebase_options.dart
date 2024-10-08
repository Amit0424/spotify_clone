// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAHuCRoZKwMV66gsXQfy3udACgjBxOMoMQ',
    appId: '1:386277322892:web:ec35cebe1b01006107cba9',
    messagingSenderId: '386277322892',
    projectId: 'spotify0424',
    authDomain: 'spotify0424.firebaseapp.com',
    storageBucket: 'spotify0424.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCcwX9FelNXcGpxfaF22lA8oQrwykiRBfo',
    appId: '1:386277322892:android:05c490be0148d19707cba9',
    messagingSenderId: '386277322892',
    projectId: 'spotify0424',
    storageBucket: 'spotify0424.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNpXsF3U-hek3PeDT_FYqCLTbAa-D9WAQ',
    appId: '1:386277322892:ios:68805b9d81e005da07cba9',
    messagingSenderId: '386277322892',
    projectId: 'spotify0424',
    storageBucket: 'spotify0424.appspot.com',
    iosBundleId: 'com.example.spotifyClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNpXsF3U-hek3PeDT_FYqCLTbAa-D9WAQ',
    appId: '1:386277322892:ios:68805b9d81e005da07cba9',
    messagingSenderId: '386277322892',
    projectId: 'spotify0424',
    storageBucket: 'spotify0424.appspot.com',
    iosBundleId: 'com.example.spotifyClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAHuCRoZKwMV66gsXQfy3udACgjBxOMoMQ',
    appId: '1:386277322892:web:9812c146d971fcf407cba9',
    messagingSenderId: '386277322892',
    projectId: 'spotify0424',
    authDomain: 'spotify0424.firebaseapp.com',
    storageBucket: 'spotify0424.appspot.com',
  );
}
