import 'package:flutter_yyts/redux/actions/lib_actions.dart';
import 'package:flutter_yyts/redux/actions/main_action.dart';
import 'package:flutter_yyts/redux/states/lib_state.dart';

LibState reducer(LibState state, ActionType action) {
  if (action is UpdateLibResourceListAction) {
    return state.copyWith(resources: action.payload, isloading: false);
  }
  return state;
}
