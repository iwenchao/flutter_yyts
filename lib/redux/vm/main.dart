import 'package:flutter_yyts/redux/states/ReduxState.dart';
import 'package:redux/redux.dart';

abstract class ViewModel {}


class StorContainer{
  static final Store<ReduxState> global = reduxStore();
}

Store<ReduxState> reduxStore()=> Store<ReduxState>(reduxReducer,
initialState: ReduxState(
  ho
))