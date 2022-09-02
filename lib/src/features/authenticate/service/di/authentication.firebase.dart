import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gastawallet/src/data/network/firebase_client.dart';
import 'package:gastawallet/src/features/authenticate/data/local/di/user.ds.dart';
import 'package:gastawallet/src/features/authenticate/model/user.m.dart';
import 'package:gastawallet/src/features/authenticate/model/user.m.p.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton()
class AuthenticationFirebaseService {
  final FirebaseClient _firebaseClient;
  final UserDataSource _dataSource;
  final logger = Logger('auth.firebase');

  AuthenticationFirebaseService(this._firebaseClient, this._dataSource);

  Future<UserCredential?> createAccountByEmail(
      String email, String password) async {
    final result = await _firebaseClient.createUserWithEmailAndPassword(
        email.trim(), password.trim());
    await _firebaseClient.setValue(
      "user/${result?.user?.uid}",
      UserModelPersistence().toJson(
        UserModel(
          uid: result?.user?.uid ?? "",
        ),
      ),
    );
    return result;
  }

  Future<void> setPin(String pin) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw "user not found";
      }
      final userLocalDataList = await _dataSource
          .getByFilter(<String, dynamic>{UserModelFields.uid: user.uid});

      if (userLocalDataList == null || userLocalDataList.isEmpty) {
        throw "user local data not found";
      }
      // print(userLocalDataList[0].todoList.setPin);
      final userLocalData = userLocalDataList[0].copyWith(<String, dynamic>{
        UserModelFields.pin: pin,
        UserModelFields.actionSetPin: 1
      });
      logger.info(userLocalData);
      await _dataSource.update(userLocalData);
      return _firebaseClient.setValue(
          "user/${user.uid}", UserModelPersistence().toJson(userLocalData));
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential? result;
    UserModel user = UserModel();

    try {
      result =
          await _firebaseClient.signInWithEmailAndPassword(email, password);
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      return null;
    }

    try {
      final userData =
          await _firebaseClient.getData("user/${result.user?.uid}");
      user = UserModelPersistence().fromJson(
        Map<String, dynamic>.from(userData.value as dynamic)
      );
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      return null;
    }

    try {
      await _dataSource.insert(user);
    } catch (e) {
      logger.warning(e);
      return null;
    }
    return result;
  }

  Future<void> signOut() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw "user not found";
      }
      try {
        final userLocalData =
            await _dataSource.getByFilter(<String, dynamic>{"uid": user.uid});
        if (userLocalData == null || userLocalData.isEmpty) {
          throw "user local data not found";
        }
        final id = userLocalData[0].id;
        _dataSource.delete(id);
      } catch (e) {
        logger.warning(e);
      }
      return _firebaseClient.signOut();
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
    }
  }

  Stream<DatabaseEvent> onUserDBValue() {
    return _firebaseClient.onUserDBValue();
  }

  void verifyPhoneNumber(
    String phoneNumber ,
    {
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(FirebaseAuthException) verificationFailed,
      required Function(String, int?)  codeSent,
      required Function(String) codeAutoRetrievalTimeout,
    }
  ) {
    _firebaseClient.verifyPhoneNumber(
      phoneNumber,
      verificationCompleted: (credential) {
        print('completed');
        print(credential);
        verificationCompleted(credential);
      },
      verificationFailed: (exception) {
        print('failed');
        print(exception);
        verificationFailed(exception);
      },
      codeSent: (s , i) {
        print('code sent');
        print(s);
        print(i);
        codeSent(s,i);
      },
      codeAutoRetrievalTimeout: (s) {
        print('auto retrive');
        print(s);
        codeAutoRetrievalTimeout(s);
      }
    );
  } 

  Future<UserCredential?> signInWithCredential(PhoneAuthCredential credential) async {
    UserCredential? result;
    UserModel user;
    try {
      result =  await _firebaseClient.signInWithCredential(credential);
    }on FirebaseAuthException catch(e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw e;
    }

    try {
      final userData =
          await _firebaseClient.getData("user/${result.user?.uid}");
      if(userData.value != null) {
        user = UserModelPersistence().fromJson(
          Map<String, dynamic>.from(userData.value as dynamic)
        );
      } else {
        user = UserModel(uid: result.user?.uid ?? "");
      }
      
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw e;
    }

    try {
      await _dataSource.insert(user);
    } catch (e) {
      logger.warning(e);
      throw e;
    }
    return result;
  }
}
