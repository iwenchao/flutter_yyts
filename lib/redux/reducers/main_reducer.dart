import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/reducers/home_reducer.dart' as home;
import 'package:flutter_yyts/redux/reducers/profile_reducer.dart' as profile;
import 'package:flutter_yyts/redux/reducers/rank_reducer.dart' as rank;
import 'package:flutter_yyts/redux/reducers/lib_reducer.dart' as lib;

ReduxState reduxReducer(ReduxState state, action) => ReduxState(
      home: home.reducer(state.home, action),
      profile: profile.reducer(state.profile, action),
      rank: rank.reducer(state.rank, action),
      lib: lib.reducer(state.lib, action),
    );
