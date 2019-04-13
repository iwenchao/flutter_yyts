import 'package:flutter_yyts/redux/actions/home_action.dart';
import 'package:flutter_yyts/redux/actions/main_action.dart';
import 'package:flutter_yyts/redux/states/home_state.dart';

HomeState reducer(HomeState state, ActionType action) {
  if (action is UpdateTVScheduleAction) {
    return state.copyWith(schedules: action.payload, isLoading: false);
  }
  if (action is UpdateAdsAction) {
    return state.copyWith(ads: action.payload, isLoading: false);
  }
  if (action is UpdateArticleAction) {
    return state.copyWith(articles: action.payload, isLoading: false);
  }
  return state;
}
