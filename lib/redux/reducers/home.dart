import 'package:flutter_yyts/redux/actions/home.dart';
import 'package:flutter_yyts/redux/actions/main.dart';
import 'package:flutter_yyts/redux/states/home.dart';

HomeState reducer(HomeState state, ActionType action) {
  if (action is UpdateTVSchedule) {
    return state.copyWith(schedules: action.payload);
  }
  if (action is UpdateAds) {
    return state.copyWith(ads: action.payload, isLoading: false);
  }
  return state;
}
