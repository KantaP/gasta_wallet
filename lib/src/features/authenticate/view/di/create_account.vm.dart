import 'package:gastawallet/src/constants/routes.dart';
import 'package:gastawallet/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:injectable/injectable.dart';
import 'package:gastawallet/src/features/authenticate/data/repositories/authentication.repo.dart';
import 'package:gastawallet/src/features/authenticate/model/create_account.st.dart';
import 'package:gastawallet/src/view_model/app_routes.dart';
import 'package:gastawallet/src/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class CreateAccountViewModel extends ViewModel {
  
  final AuthenticationRepository _repository;
  final AuthenticationFirebaseService _service;
  CreateAccountViewModel(this._repository, this._service);

  final _stateSubject =
      BehaviorSubject<CreateAccountState>.seeded(CreateAccountState());
  Stream<CreateAccountState> get state => _stateSubject;

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

  void _setLoading(bool loading) {
    updateState(<String, dynamic>{CreateAccountFields.isLoading: loading});
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  Future<void> createAccountByEmail() async {
    if (!_validateForm()) return;

    _setLoading(true);
    final state = _stateSubject.value;
    // bool result =
    //     await _service.createAccountByEmail(state.username, state.password);
    _setLoading(false);
    Future.delayed(const Duration(milliseconds: 500), () {
      // if (result) {
        _routesSubject.add(const AppRouteSpec(name: RoutesConstant.setPin));
        // _routesSubject.add(const AppRouteSpec.pop());
      // }
    });
    return;
  }

  bool _validateForm() {
    final state = _stateSubject.value;
    if (state.username.isEmpty) return false;
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(state.username)) return false;
    if (state.password.isEmpty) return false;
    if (state.confirmPassword.isEmpty) return false;
    if (state.password != state.confirmPassword) return false;
    if (state.acceptTerm == false) return false;
    return true;
  }
}
