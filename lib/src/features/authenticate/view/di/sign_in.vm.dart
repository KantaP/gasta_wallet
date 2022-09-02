import 'package:gastawallet/src/data/local/shared_preferences.dart';
import 'package:gastawallet/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:gastawallet/src/constants/routes.dart';
import 'package:gastawallet/src/features/authenticate/data/repositories/authentication.repo.dart';
import 'package:gastawallet/src/view_model/app_routes.dart';
import 'package:gastawallet/src/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/sign_in.st.dart';

@Injectable()
class SignInPageViewModel extends ViewModel {

  final AuthenticationRepository _repository;
  final AuthenticationFirebaseService _service;
  final SharedPreferencesHelper _sharedPreferencesHelper;

  SignInPageViewModel(this._repository, this._service, this._sharedPreferencesHelper);

  final _stateSubject =
      BehaviorSubject<SignInPageState>.seeded(SignInPageState());
  Stream<SignInPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final logger = Logger("signInPageViewModel");

  void updateUsername(String username) {
    updateState(<String, dynamic>{SignInFields.username: username});
  }

  void updatePassword(String password) {
    updateState(<String, dynamic>{SignInFields.password: password});
  }

  void signIn() async {
    final state = _stateSubject.value;
    final result = await _service.signInWithEmailAndPassword(state.username, state.password);
    if(result != null) {
      await _sharedPreferencesHelper.setLoggedIn(true);
      _routesSubject.add(const AppRouteSpec(name: RoutesConstant.home , action: AppRouteAction.replaceWith));
    }
  }

  void goToCreateAccount() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.createAccount));
  }

  void goToPhoneAuth() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.phoneAuth));
  }
  
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
}
