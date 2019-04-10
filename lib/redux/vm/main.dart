import 'package:flutter_yyts/redux/states/home.dart';
import 'package:flutter_yyts/redux/states/main.dart';
import 'package:flutter_yyts/redux/states/profile.dart';
import 'package:redux/redux.dart';
import 'package:flutter_yyts/redux/reducers/main.dart';

abstract class ViewModel {
  final Store<ReduxState> store;

  ViewModel(this.store);
}

class StoreContainer {
  static final Store<ReduxState> global = reduxStore();
}

Store<ReduxState> reduxStore() => Store<ReduxState>(reduxReducer,
    initialState: ReduxState(
        home: HomeState.initialState(), profile: ProfileState.initialState()));
