import 'package:flutter_yyts/redux/actions/main_action.dart';
import 'package:flutter_yyts/redux/actions/rank_action.dart';
import 'package:flutter_yyts/redux/states/rank_state.dart';

RankState reducer(RankState state, ActionType action) {
  if (action is UpdateTopRanksAction) {
    return state.copyWith(ranks: action.payload, isloading: action.isloading);
  }
  return state;
}
