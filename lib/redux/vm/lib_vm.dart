import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/main_vm.dart';
import 'package:redux/src/store.dart';

class LibViewModel extends ViewModel {
  LibViewModel(Store<ReduxState> store) : super(store);
}
