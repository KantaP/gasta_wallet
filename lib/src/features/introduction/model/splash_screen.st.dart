import 'package:gastawallet/src/view_model/page_state.abs.dart';

class SplashScreenState implements IPageState<SplashScreenState> {

  bool _isLoading = false;

  SplashScreenState({
    bool isLoading = false,
  }) {
    _isLoading = isLoading;
  }

  bool get isLoading => _isLoading;


  @override
  SplashScreenState copyWith(Map<String, dynamic> value) {
    return SplashScreenState(
      isLoading: value[SplashScreenFields.isLoading] ?? _isLoading,
    );
  }
}

class SplashScreenFields {
  SplashScreenFields._();
  static const String isLoading = "isLoading";
}