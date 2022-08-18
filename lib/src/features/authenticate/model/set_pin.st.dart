import 'package:gastawallet/src/view_model/page_state.abs.dart';

class SetPinState implements IPageState<SetPinState> {

  String _pin = "";
  String _confirmPin = "";

  SetPinState({
    String pin = "",
    String confirmPin = ""
  }) {
    _pin = pin;
    _confirmPin = confirmPin;
  }

  String get pin => _pin;
  String get confirmPin => _confirmPin;

  @override
  SetPinState copyWith(Map<String, dynamic> value) {
    return SetPinState(
      pin: value[SetPinFields.pin] ?? _pin ,
      confirmPin: value[SetPinFields.confirmPin] ?? _confirmPin ,
    );
  }

}

class SetPinFields { 
  SetPinFields._();

  static const String pin = "pin";
  static const String confirmPin = "confirmPin";
}