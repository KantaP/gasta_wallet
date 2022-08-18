import 'package:firebase_auth/firebase_auth.dart';
import 'package:gastawallet/src/data/network/firebase_client.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton()
class SplashScreenFirebaseService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('auth.firebase');

  SplashScreenFirebaseService(this._firebaseClient);

  User? currentUser() {
    return _firebaseClient.currentUser();
  }
}