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
    apiKey: 'AIzaSyCcwr_cmrXJngyM9TNS-N70fR1T7bbQW_c',
    appId: '1:385275291791:web:603ddf050846985b8da8fa',
    messagingSenderId: '385275291791',
    projectId: 'gasta-wallet-dev',
    authDomain: 'gasta-wallet-dev.firebaseapp.com',
    databaseURL: 'https://gasta-wallet-dev-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gasta-wallet-dev.appspot.com',
    measurementId: 'G-3BY7R01NS5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfVbdALI1_1YAzToDI4SX9S5txuh44YvI',
    appId: '1:385275291791:android:771dc0bd3c5169d38da8fa',
    messagingSenderId: '385275291791',
    projectId: 'gasta-wallet-dev',
    databaseURL: 'https://gasta-wallet-dev-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gasta-wallet-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQb_spiqAgud4ZQ3vz4n3AUtvjSSIKA1Y',
    appId: '1:385275291791:ios:721a73db7676d2118da8fa',
    messagingSenderId: '385275291791',
    projectId: 'gasta-wallet-dev',
    databaseURL: 'https://gasta-wallet-dev-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gasta-wallet-dev.appspot.com',
    iosClientId: '385275291791-f3sb4bi880qsmvvhi6m8649i7s38ba56.apps.googleusercontent.com',
    iosBundleId: 'org.gasta.wallet.production',
  );
 
  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQb_spiqAgud4ZQ3vz4n3AUtvjSSIKA1Y',
    appId: '1:385275291791:ios:28521d933388e7df8da8fa',
    messagingSenderId: '385275291791',
    projectId: 'gasta-wallet-dev',
    databaseURL: 'https://gasta-wallet-dev-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gasta-wallet-dev.appspot.com',
    iosClientId: '385275291791-afn7qp5pi48b7qfd0ritvonugtve2tb2.apps.googleusercontent.com',
    iosBundleId: 'org.acromod.prototype',
  );
}
