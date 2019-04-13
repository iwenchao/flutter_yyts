import 'package:flutter_yyts/redux/actions/main_action.dart';
import 'package:flutter_yyts/redux/actions/profile_action.dart';
import 'package:flutter_yyts/redux/states/profile_state.dart';

ProfileState reducer(ProfileState state, ActionType action) {
  if (action is UpdateUserProfileAction) {
    return state.copyWith(profile: action.payload);
  }
  return state;
}
