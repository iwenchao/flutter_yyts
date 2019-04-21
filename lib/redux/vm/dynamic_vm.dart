import 'package:flutter_yyts/models/comment_info.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/main_vm.dart';
import 'package:redux/src/store.dart';

class DynamicViewModel extends ViewModel {
  DynamicViewModel(Store<ReduxState> store) : super(store);

  List<CommentVo> get commentList => this
      .store
      .state
      .dynamicState
      .commentList
      .where((v) => v.resourceInfo != null)
      .toList();

  bool get isloading => this.store.state.dynamicState.isloading;
}
