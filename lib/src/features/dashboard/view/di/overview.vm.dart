import 'package:gastawallet/src/features/dashboard/model/overview.st.dart';
import 'package:gastawallet/src/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class OverViewViewModel extends ViewModel {

  final _stateSubject = BehaviorSubject<OverViewState>.seeded(OverViewState());
  Stream<OverViewState> get state => _stateSubject;

  @override
  void dispose() {
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

}