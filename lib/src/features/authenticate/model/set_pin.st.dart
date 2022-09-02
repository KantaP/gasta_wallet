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
  bool get pinAlready => (_pin.length == 4);
  bool get confirmPinAlready => _confirmPin.length == 4;

  @override
  SetPinState copyWith(Map<String, dynamic> value) {
    return SetPinState(
      pin: value[SetPinFields.pin] ?? _pin ,
      confirmPin: value[SetPinFields.confirmPin] ?? _confirmPin ,
    );
  }

  String getPinIndex(int index) {
    if(pin.isEmpty) return "";
    if((pin.length - 1) < index) {
      return "";
    }
    return pin.split("")[index];
  }

  String getConfirmPinIndex(int index) {
    if(confirmPin.isEmpty) return "";
    if((confirmPin.length - 1) < index) {
      return "";
    }
    return confirmPin.split("")[index];
  }

}

class SetPinFields { 
  SetPinFields._();

  static const String pin = "pin";
  static const String confirmPin = "confirmPin";
}