import 'package:gastawallet/src/constants/routes.dart';
import 'package:gastawallet/src/data/local/shared_preferences.dart';
import 'package:gastawallet/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:gastawallet/src/features/dashboard/model/overview.st.dart';
import 'package:gastawallet/src/view_model/app_routes.dart';
import 'package:gastawallet/src/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class OverViewViewModel extends ViewModel {
  final AuthenticationFirebaseService _service;
  final SharedPreferencesHelper _preferencesHelper;
  OverViewViewModel(this._service, this._preferencesHelper);

  final _stateSubject = BehaviorSubject<OverViewState>.seeded(OverViewState());
  Stream<OverViewState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  @override
  void dispose() {
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  Future<void> signOut() async {
    await _service.signOut();
    await _preferencesHelper.setLoggedIn(false);
    print('loggout');
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.userSignIn , action: AppRouteAction.replaceWith));
  }
}
