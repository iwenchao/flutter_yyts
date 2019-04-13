import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/redux/states/home_state.dart';
import 'package:flutter_yyts/redux/states/profile_state.dart';

@immutable
class ReduxState {
  final HomeState home;
  final ProfileState profile;

  const ReduxState({this.profile, this.home});
}
