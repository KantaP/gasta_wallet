import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton()
class FirebaseClient {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  final logger = Logger('firebase');

  Future<bool> createUserWithEmailAndPassword(String email, String password) async {
    try {
       await firebaseAuth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
       return true;
    } on FirebaseAuthException catch  (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      return false;
    }
  }

  Future<void> setValue(String dbRef, Map<String, dynamic> value) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if(user == null) {
        throw "user not found";
      }
       DatabaseReference ref = firebaseDatabase.ref(dbRef);
       await ref.set(value);
    } on FirebaseAuthException catch  (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw e;
    }
  }

  User? currentUser() {
    return firebaseAuth.currentUser;
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.warning('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        logger.warning('Wrong password provided for that user.');
      }
      throw e;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    return;
  }
}