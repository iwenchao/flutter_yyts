import 'package:flutter_yyts/redux/actions/main.dart';
import 'package:flutter_yyts/redux/actions/profile.dart';
import 'package:flutter_yyts/redux/states/profile.dart';

ProfileState reducer(ProfileState state, ActionType action) {
  if (action is UpdateUserProfile) {
    return state.copyWith(profile: action.payload);
  }
  return state;
}
