import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gastawallet/src/data/network/firebase_client.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton()
class AuthenticationFirebaseService {

  final FirebaseClient _firebaseClient;
  final logger = Logger('auth.firebase');

  AuthenticationFirebaseService(this._firebaseClient);

  Future<bool> createAccountByEmail(String email, String password) async {
    bool result = await _firebaseClient.createUserWithEmailAndPassword(email.trim(), password.trim());
    return result;
  }

  Future<void> setPin(String pin) async{
    try {
      final user = _firebaseClient.currentUser();
      if(user == null) {
        throw "user not found";
      }
      _firebaseClient.setValue("user/${user.hashCode}", {
        "pin" : pin
      });
    } on FirebaseAuthException catch  (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) {
    return _firebaseClient.signInWithEmailAndPassword(email, password);
  }
}