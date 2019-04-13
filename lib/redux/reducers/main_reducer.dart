import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/reducers/home_reducer.dart' as home;
import 'package:flutter_yyts/redux/reducers/profile_reducer.dart' as profile;

ReduxState reduxReducer(ReduxState state, action) => ReduxState(
    home: home.reducer(state.home, action),
    profile: profile.reducer(state.profile, action));
