import 'package:flutter_yyts/redux/states/main.dart';
import 'package:flutter_yyts/redux/reducers/home.dart' as home;

ReduxState reduxReducer(ReduxState state, action) =>
    ReduxState(home: home.reducer(state.home, action));
