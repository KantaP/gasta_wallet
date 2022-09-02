import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
@Singleton()
class SharedPreferencesHelper {

  final SharedPreferences _pref;
  SharedPreferencesHelper(this._pref);

  // First time open app
  Future<bool> setPassFirstTime(bool passFirstTime) async {
    return _pref.setBool("passFirstTime", passFirstTime);
  }

  Future<bool?> getPassFirstTime() async {
    return _pref.getBool("passFirstTime");
  }
  // End

  // Authentication 
  Future<bool> setLoggedIn(bool logged) async {
    return _pref.setBool("loggedIn", logged);
  }

  Future<bool?> getLoggedIn() async {
    return _pref.getBool("loggedIn");
  }
  // End

  //User data
  // Future<bool> setUserProfile(String value) {
  //   return _pref.setString("user_todolist", value);
  // } 

  // String? getUserProfile() {
  //   return _pref.getString("user_todolist");
  // }
  // End
}