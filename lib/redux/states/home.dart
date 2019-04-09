import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/models/tv_schedule.dart';
import 'package:flutter_yyts/redux/actions/home.dart';

@immutable
class HomeState {
  final List<UpdateTVSchedule> schedules;
  final bool isLoading;

  HomeState({this.schedules, this.isLoading});

  HomeState copyWith({List<TVSchedule> schedules, bool isLoading}) {
    return HomeState(
        schedules: schedules ?? this.schedules,
        isLoading: isLoading ?? this.isLoading);
  }

  HomeState.initialState()
      : schedules = [],
        isLoading = true;
}
