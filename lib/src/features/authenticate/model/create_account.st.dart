import 'package:gastawallet/src/view_model/page_state.abs.dart';

class CreateAccountState implements IPageState<CreateAccountState> {


  bool _acceptTerm = false;
  bool _isLoading = false;

  String _mobileNumber = "";

  CreateAccountState({
    bool acceptTerm = false ,
    bool isLoading = false,
    String mobileNumber = "",
  }) {
    _acceptTerm = acceptTerm;
    _isLoading = isLoading;
    _mobileNumber = mobileNumber;
  }

  bool get acceptTerm => _acceptTerm;
  bool get isLoading => _isLoading;
  String get mobileNumber => _mobileNumber;


  @override
  CreateAccountState copyWith(Map<String, dynamic> value) {
    return CreateAccountState(
      acceptTerm: value[CreateAccountFields.acceptTerm] ?? _acceptTerm,
      isLoading: value[CreateAccountFields.isLoading] ?? _isLoading,
      mobileNumber: value[CreateAccountFields.mobileNumber] ?? _mobileNumber,
    );
  }
}

class CreateAccountFields {
  CreateAccountFields._();
  static const String acceptTerm = "acceptTerm";
  static const String isLoading = "isLoading";
  static const String mobileNumber = "mobileNumber";
}