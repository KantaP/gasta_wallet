
import 'dart:async';
import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gastawallet/src/constants/key.dart';
import 'package:gastawallet/src/constants/routes.dart';
import 'package:gastawallet/src/data/local/shared_preferences.dart';
import 'package:gastawallet/src/features/authenticate/model/set_pin.st.dart';
import 'package:gastawallet/src/features/authenticate/model/user.m.p.dart';
import 'package:gastawallet/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:gastawallet/src/view_model/app_routes.dart';
import 'package:gastawallet/src/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class SetPinViewModel extends ViewModel {

  final AuthenticationFirebaseService _service;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  SetPinViewModel(this._service, this._sharedPreferencesHelper);
  
  final _stateSubject =
      BehaviorSubject<SetPinState>.seeded(SetPinState());

  
  Stream<SetPinState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  late StreamSubscription<DatabaseEvent> databaseSubscriber;
  final logger = Logger("set_pin_vm");

   @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
    databaseSubscriber.cancel();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void setPin(String value) {
    final state = _stateSubject.value;
    if(state.pin.length < 4) {
      updateState(<String, dynamic> {
        SetPinFields.pin: state.pin + value,
      });
      return;
    } 
    if(state.confirmPin.length < 4) {
        updateState(<String, dynamic> {
        SetPinFields.confirmPin: state.confirmPin + value,
      });
    }

  }

  void removePin() {
    final state = _stateSubject.value;
    if(state.confirmPin.isNotEmpty) {
      final removedPin = state.confirmPin.substring(0,state.confirmPin.length - 1);
      updateState(<String, dynamic> {
        SetPinFields.confirmPin: removedPin,
      });
      return;
    }
    if(state.pin.isNotEmpty) {
      final removedPin = state.pin.substring(0,state.pin.length - 1);
      updateState(<String, dynamic> {
        SetPinFields.pin: removedPin,
      });
    }
  }

  void listenState() {
    state.listen((event) { 
      if(event.confirmPinAlready && event.pinAlready) {
        if(event.pin != event.confirmPin) {
          //
          return;
        }
        final key = Key.fromUtf8(AppKey.aesKey);
        final iv = IV.fromLength(16);
        final encrypter = Encrypter(AES(key));
        final encrypted = encrypter.encrypt(event.pin, iv: iv);
        _service.setPin(encrypted.base64);
      }
    });
  }

  void listenFirebaseDB() {
    databaseSubscriber = _service.onUserDBValue().listen((event) { 
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
     
      final user = UserModelPersistence().fromJson(data);
      
      if(user.actionSetPin == 1) {
        _sharedPreferencesHelper.setLoggedIn(true);
        _routesSubject.add(const AppRouteSpec(name: RoutesConstant.home , action: AppRouteAction.replaceWith));
      }
    });
  }

}