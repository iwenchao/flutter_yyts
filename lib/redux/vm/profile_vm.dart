import 'package:flutter_yyts/models/profile_info.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/main_vm.dart';
import 'package:redux/src/store.dart';

class ProfileViewModel extends ViewModel {
  ProfileViewModel(Store<ReduxState> store) : super(store);

  ProfileVo get profile => this.store.state.profile.profile;
}
