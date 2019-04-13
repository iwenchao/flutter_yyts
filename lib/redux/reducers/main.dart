import 'package:flutter_yyts/redux/states/main.dart';
import 'package:flutter_yyts/redux/reducers/home.dart' as home;
import 'package:flutter_yyts/redux/reducers/profile.dart' as profile;

ReduxState reduxReducer(ReduxState state, action) => ReduxState(
    home: home.reducer(state.home, action),
    profile: profile.reducer(state.profile, action));
