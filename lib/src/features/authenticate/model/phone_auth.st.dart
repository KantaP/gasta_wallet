import 'package:gastawallet/src/view_model/page_state.abs.dart';

class PhoneAuthState implements IPageState<PhoneAuthState> {

  bool _isLoading = false;
  String _mobileNumber = "";

  PhoneAuthState({
    bool isLoading = false,
    String mobileNumber = "",
  }) {
    _isLoading = isLoading;
    _mobileNumber = mobileNumber;
  }

  bool get isLoading => _isLoading;
  String get mobileNumber => _mobileNumber;


  @override
  PhoneAuthState copyWith(Map<String, dynamic> value) {
    return PhoneAuthState(
      isLoading: value[PhoneAuthFields.isLoading] ?? _isLoading,
      mobileNumber: value[PhoneAuthFields.mobileNumber] ?? _mobileNumber,
    );
  }
}


class PhoneAuthFields {
  PhoneAuthFields._();
  static const String isLoading = "isLoading";
  static const String mobileNumber = "mobileNumber";
}