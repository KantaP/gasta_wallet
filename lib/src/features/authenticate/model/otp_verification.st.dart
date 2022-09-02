import 'package:gastawallet/src/view_model/page_state.abs.dart';

class OtpVerificationState implements IPageState<OtpVerificationState> {

  String _otp = "";
  String _phoneNumber = "";
  String _verificationId = "";
  String _errorState = "";
  String _mode = "";
  OtpVerificationState({
    String otp = "" , 
    String phoneNumber = "",
    String verificationId = "",
    String errorState = "",
    String mode = "",
  }) {
    _otp = otp;
    _phoneNumber = phoneNumber;
    _verificationId = verificationId;
    _errorState = errorState;
    _mode = mode;
  }

  String get otp => _otp;
  String get phoneNumber => _phoneNumber;
  String get verificationId => _verificationId;
  String get errorState => _errorState;
  String get mode => _mode;


  @override
  OtpVerificationState copyWith(Map<String, dynamic> value) {
    return OtpVerificationState(
      otp: value[OtpVerificationFields.otp] ?? _otp,
      phoneNumber: value[OtpVerificationFields.phoneNumber] ?? _phoneNumber,
      verificationId: value[OtpVerificationFields.verificationId] ?? _verificationId,
      errorState: value[OtpVerificationFields.errorState] ?? _errorState ,
      mode: value[OtpVerificationFields.mode] ?? _mode,
    );
  }

}

class OtpVerificationFields {
  OtpVerificationFields._();

  static const String otp = "otp";
  static const String phoneNumber = "phoneNumber";
  static const String verificationId = "verificationId";
  static const String errorState = "errorState";
  static const String mode = "mode";
}