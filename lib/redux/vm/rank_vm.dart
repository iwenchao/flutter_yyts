import 'package:flutter_yyts/models/ranks_info.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/main_vm.dart';
import 'package:redux/src/store.dart';

class RankViewModel extends ViewModel {
  RankViewModel(Store<ReduxState> store) : super(store);

  Ranks get ranks => this.store.state.rank.ranks;
  bool get isloading => this.store.state.rank.isloading;
}
