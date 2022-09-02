import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gastawallet/src/constants/routes.dart';
import 'package:gastawallet/src/data/local/shared_preferences.dart';
import 'package:gastawallet/src/features/introduction/model/splash_screen.st.dart';
import 'package:gastawallet/src/features/introduction/service/di/splash_screen.firebase.dart';
import 'package:gastawallet/src/view_model/app_routes.dart';
import 'package:gastawallet/src/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class SplashScreenViewModel extends ViewModel {

  final SplashScreenFirebaseService _service;
  final SharedPreferencesHelper _preferencesHelper;
  SplashScreenViewModel(this._service, this._preferencesHelper);

  final _stateSubject = BehaviorSubject<SplashScreenState>.seeded(SplashScreenState());

  Stream<SplashScreenState> get state => _stateSubject;

  final _routesSubject= PublishSubject<AppRouteSpec>();
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

  void checkAuth() async {

    final passFirstTime = await _preferencesHelper.getPassFirstTime();
    if(
      passFirstTime == null ||
      passFirstTime == false ){
        showGettingStarted();
        return;
    }

    User? currentUser = _service.currentUser();
    final bool? loggedIn = await _preferencesHelper.getLoggedIn();
    if(currentUser != null && loggedIn == true && loggedIn != null) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        _routesSubject.add(const AppRouteSpec(name: RoutesConstant.home, action: AppRouteAction.replaceWith));
      });
    }else {
      Future.delayed(const Duration(milliseconds: 1000), () {
        _routesSubject.add(const AppRouteSpec(name: RoutesConstant.userSignIn, action: AppRouteAction.replaceWith));
      });
    }    
  }

  void showGettingStarted() {
    Future.delayed(const Duration(milliseconds: 1000), () {
        _routesSubject.add(const AppRouteSpec(name: RoutesConstant.gettingStarted, action: AppRouteAction.replaceWith));
    });
  }


}