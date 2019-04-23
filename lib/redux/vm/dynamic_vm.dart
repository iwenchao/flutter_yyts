import 'package:flutter_yyts/models/comment_info.dart';
import 'package:flutter_yyts/models/help_info.dart';
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

  ///正在下载标志
  bool get isloading => this.store.state.dynamicState.isloading;

  ///helplist数据
  List<HelpVo> get helpList => this.store.state.dynamicState.helpList;
}
