import 'package:firebase_auth/firebase_auth.dart';
import 'package:gastawallet/src/constants/firebase_exception.dart';
import 'package:gastawallet/src/constants/routes.dart';
import 'package:gastawallet/src/features/authenticate/model/otp_verification.st.dart';
import 'package:gastawallet/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:gastawallet/src/view_model/app_routes.dart';
import 'package:gastawallet/src/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class OtpVerificationViewModel extends ViewModel {
  final AuthenticationFirebaseService _service;
  OtpVerificationViewModel(this._service);

  final _stateSubject =
      BehaviorSubject<OtpVerificationState>.seeded(OtpVerificationState());

  Stream<OtpVerificationState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final logger = Logger("otp_verification_viewmodel");

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  Future<void> onChangedOtp(String value) async {
    if (value.length == 6) {
      // submit otp
      try {
        final state = _stateSubject.value;
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: state.verificationId, smsCode: value
        );
        final user = await _service.signInWithCredential(credential);
        // print(user);
        if(user != null) {
          if(state.mode == "signIn") {
            _routesSubject.add(const AppRouteSpec(name: RoutesConstant.home, action: AppRouteAction.replaceWith));
          } else {
            _routesSubject.add(const AppRouteSpec(name: RoutesConstant.setPin));
          }
         
        }
      } on FirebaseAuthException catch(e) {
        
        if(e.code == FirebaseExceptionCode.invalidVerificationCode) {
          updateState(<String , dynamic> {
            OtpVerificationFields.errorState : e.code
          });
        }

        if(e.code == FirebaseExceptionCode.sessionExpired) {
          updateState(<String , dynamic> {
            OtpVerificationFields.errorState : e.code
          });
        }
      }
      
    }
  }

  void verifyPhoneNumber() {
    final state = _stateSubject.value;
    _service.verifyPhoneNumber(
      state.phoneNumber,
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
  }

  void _onVerificationCompleted(PhoneAuthCredential credential) {
    print('completed');
  }

  void _onVerificationFailed(FirebaseAuthException exception) {
    print('failed');
  }

  void _codeSent(String s, int? datetime) {
    updateState(<String, dynamic>{OtpVerificationFields.verificationId: s});
  }

  void _codeAutoRetrievalTimeout(String s) {
    updateState(<String, dynamic>{OtpVerificationFields.verificationId: s});
  }
}
