import 'package:gastawallet/src/view_model/page_state.abs.dart';

class MainState implements IPageState<MainState> {

  int _currentIndex = 0;
  MainState({
    int currentIndex = 0
  }) {
    _currentIndex = currentIndex;
  }

  int get currentIndex => _currentIndex;

  @override
  MainState copyWith(Map<String, dynamic> value) {
   return MainState(
    currentIndex: value[MainFields.currentIndex] ?? _currentIndex
   );
  }

}

class MainFields {
  MainFields._();

  static const String currentIndex = "currentIndex";
}