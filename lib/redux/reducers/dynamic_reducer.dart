import 'package:flutter_yyts/redux/actions/comment_action.dart';
import 'package:flutter_yyts/redux/actions/main_action.dart';
import 'package:flutter_yyts/redux/states/dynamic_state.dart';

DynamicState reducer(DynamicState state, ActionType action) {
  if (action is UpdateCommentListAction) {
    return state.copyWith(commentList: action.payload, isloading: false);
  }
  return state;
}
