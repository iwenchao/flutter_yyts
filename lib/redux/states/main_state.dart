import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/redux/states/home_state.dart';
import 'package:flutter_yyts/redux/states/profile_state.dart';
import 'package:flutter_yyts/redux/states/rank_state.dart';

@immutable
class ReduxState {
  final HomeState home;
  final ProfileState profile;
  final RankState rank;

  const ReduxState({this.profile, this.home, this.rank});
}
