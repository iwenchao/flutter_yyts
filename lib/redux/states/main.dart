import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/redux/states/home.dart';
import 'package:flutter_yyts/redux/states/profile.dart';

@immutable
class ReduxState {
  final HomeState home;
  final ProfileState profile;

  const ReduxState({this.profile, this.home});
}
