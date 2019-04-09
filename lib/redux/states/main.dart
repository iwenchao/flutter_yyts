import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/redux/states/home.dart';

@immutable
class ReduxState {
  final HomeState home;

  const ReduxState({this.home});
}
