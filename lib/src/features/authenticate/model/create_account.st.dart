import 'package:gastawallet/src/view_model/page_state.abs.dart';

class CreateAccountState implements IPageState<CreateAccountState> {

  String _username = "";
  String _password = "";
  String _confirmPassword = "";
  bool _acceptTerm = false;
  bool _isLoading = false;

  CreateAccountState({
    String username = "",
    String password = "",
    String confirmPassword = "",
    bool acceptTerm = false ,
    bool isLoading = false,
  }) {
    _username = username;
    _password = password;
    _confirmPassword = confirmPassword;
    _acceptTerm = acceptTerm;
    _isLoading = isLoading;
  }

  String get username => _username;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  bool get acceptTerm => _acceptTerm;
  bool get isLoading => _isLoading;


  @override
  CreateAccountState copyWith(Map<String, dynamic> value) {
    return CreateAccountState(
      username: value[CreateAccountFields.username] ?? _username,
      password: value[CreateAccountFields.password] ?? _password,
      confirmPassword: value[CreateAccountFields.confirmPassword] ?? _confirmPassword,
      acceptTerm: value[CreateAccountFields.acceptTerm] ?? _acceptTerm,
      isLoading: value[CreateAccountFields.isLoading] ?? _isLoading,
    );
  }
}

class CreateAccountFields {
  CreateAccountFields._();
  static const String username = "username";
  static const String password = "password";
  static const String confirmPassword = "confirmPassword";
  static const String acceptTerm = "acceptTerm";
  static const String isLoading = "isLoading";
}