import 'package:gastawallet/src/view_model/page_state.abs.dart';

class OverViewState implements IPageState<OverViewState> {

  bool _isLoading = false;
  OverViewState({
    bool isLoading = false
  }) {
    _isLoading = isLoading;
  }

  bool get isLoading => _isLoading;


  @override
  OverViewState copyWith(Map<String, dynamic> value) {
    return OverViewState(
      isLoading: value[OverviewFields.isLoading] ?? _isLoading,
    );
  }

}

class OverviewFields {
  OverviewFields._();

  static const String isLoading = "isLoading";
}