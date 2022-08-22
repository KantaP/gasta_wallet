import 'package:gastawallet/src/view_model/page_state.abs.dart';

class GettingStartedState implements IPageState<GettingStartedState> {

  int _infoIndex = 0;
  GettingStartedState({
    int infoIndex = 0
  }) {
    _infoIndex = infoIndex;
  }

  int get infoIndex => _infoIndex;


  @override
  GettingStartedState copyWith(Map<String, dynamic> value) {
    return GettingStartedState(
      infoIndex: value[GettingStartedFields.infoIndex] ?? _infoIndex,
    );
  }
}

class GettingStartedFields {
  GettingStartedFields._();

  static const String infoIndex = "infoIndex";
}