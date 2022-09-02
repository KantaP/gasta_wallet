import 'package:gastawallet/src/features/authenticate/model/user.m.dart';
import 'package:gastawallet/src/model/model.abs.dart';

class UserModelPersistence implements ModelJson<UserModel> {
   
  @override
  List<UserModel> fromArrayJson(List<dynamic> arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }
  
  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      uid: json['uid'] ?? "",
      actionSetPin: json['actionSetPin'] ?? 0,
      pin: json['pin'] ?? "",
    );
  }
  
  @override
  Map<String, dynamic> toJson(UserModel json) {
    return <String, dynamic> {
      "id" : json.id,
      "uid" : json.uid,
      "actionSetPin" : json.actionSetPin,
      "pin" : json.pin
    };
  }

  Map<String, dynamic> toLocalData(UserModel json) {
    return <String, dynamic> {
      "uid" : json.uid,
      "actionSetPin" : json.actionSetPin ,
      "pin" : json.pin
    };
  }
}

