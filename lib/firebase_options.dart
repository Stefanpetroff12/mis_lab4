import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCd8ssVGWszilre9EBxQKBtafH_QtIwcQM",
    authDomain: "lab-4-6a38a.firebaseapp.com",
    projectId: "lab-4-6a38a",
    storageBucket: "lab-4-6a38a.firebasestorage.app",
    messagingSenderId: "512771963510",
    appId: "1:512771963510:web:21956476b2d9c56da17d57",
    measurementId: "G-W9Q3PP7FN8",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyCd8ssVGWszilre9EBxQKBtafH_QtIwcQM",
    authDomain: "lab-4-6a38a.firebaseapp.com",
    projectId: "lab-4-6a38a",
    storageBucket: "lab-4-6a38a.firebasestorage.app",
    messagingSenderId: "512771963510",
    appId: "1:512771963510:web:21956476b2d9c56da17d57",
    measurementId: "G-W9Q3PP7FN8",
    iosBundleId: 'com.example.labbb4',
  );
}

