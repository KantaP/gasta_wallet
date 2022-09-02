import 'package:gastawallet/src/constants/routes.dart';
import 'package:gastawallet/src/features/authenticate/model/phone_auth.st.dart';
import 'package:gastawallet/src/view_model/app_routes.dart';
import 'package:gastawallet/src/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class PhoneAuthViewModel extends ViewModel {

  final _stateSubject = BehaviorSubject<PhoneAuthState>.seeded(PhoneAuthState());
  Stream<PhoneAuthState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;
  
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

   bool _validateForm() {
    final state = _stateSubject.value;
    if (state.mobileNumber.isEmpty) return false;
    return true;
  }

  Future<void> verifyPhoneNumber() async {
    if (!_validateForm()) return;
    final state = _stateSubject.value;
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.otpVerification,
        arguments: <String,dynamic>{
          "phoneNumber" : "+66${state.mobileNumber}",
          "mode" : "signIn"
        },
      ),
    );
  }
}