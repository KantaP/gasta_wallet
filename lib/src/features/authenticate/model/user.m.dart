import 'package:gastawallet/src/model/model.abs.dart';

class UserModel implements Model<UserModel>  {
  int _id = 0;
  String _uid = "";
  int _actionSetPin = 0;
  String _pin = "";

  UserModel({
    int id = 0,
    String uid = "",
    int actionSetPin = 0,
    String pin = "",
  }) {
    _id = id;
    _uid = uid;
    _actionSetPin = actionSetPin;
    _pin = pin;
  }

  int get id => _id;
  String get uid => _uid;
  int get actionSetPin => _actionSetPin;
  String get pin => _pin;

  void setId(int id) {
    _id = id;
  }
  
  @override
  UserModel copyWith(Map<String, dynamic> value) {
    return UserModel(
      id: value[UserModelFields.id] ?? _id,
      uid: value[UserModelFields.uid] ?? _uid,
      actionSetPin: value[UserModelFields.actionSetPin] ?? _actionSetPin,
      pin: value[UserModelFields.pin] ?? _pin
    );
  }
}

class UserModelFields { 
  UserModelFields._();
  static const String id = "id";
  static const String uid = "uid";
  static const String actionSetPin = "actionSetPin";
  static const String pin = "pin";
}

