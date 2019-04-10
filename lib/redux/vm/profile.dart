import 'package:flutter_yyts/models/profile.dart';
import 'package:flutter_yyts/redux/states/main.dart';
import 'package:flutter_yyts/redux/vm/main.dart';
import 'package:redux/src/store.dart';

class ProfileViewModel extends ViewModel {
  ProfileViewModel(Store<ReduxState> store) : super(store);

  Profile get profile => this.store.state.profile.profile;
}
