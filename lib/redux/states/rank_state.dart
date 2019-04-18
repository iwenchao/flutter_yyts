import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/models/ranks_info.dart';

@immutable
class RankState {
  final Ranks ranks;
  final bool isloading;

  RankState({this.ranks, this.isloading});

  RankState copyWith({Ranks ranks, bool isloading}) {
    return RankState(ranks: ranks, isloading: isloading ?? this.isloading);
  }

  RankState.initialState()
      : this.ranks = Ranks.initialState(),
        this.isloading = true;
}
