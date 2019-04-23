import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/models/comment_info.dart';
import 'package:flutter_yyts/models/help_info.dart';

@immutable
class DynamicState {
  final List<CommentVo> commentList;
  final List<HelpVo> helpList;

  final bool isloading;

  DynamicState({this.commentList, this.isloading, this.helpList});

  DynamicState copyWith(
      {List<CommentVo> commentList, bool isloading, List<HelpVo> helpList}) {
    return DynamicState(
      commentList: commentList ?? this.commentList,
      isloading: isloading ?? this.isloading,
      helpList: helpList ?? this.helpList,
    );
  }

  DynamicState.initialState()
      : this.commentList = [],
        this.helpList = [],
        this.isloading = true;
}
