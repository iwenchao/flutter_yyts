import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/models/comment_info.dart';

@immutable
class DynamicState {
  final List<CommentVo> commentList;

  final bool isloading;

  DynamicState({this.commentList, this.isloading});

  DynamicState copyWith({List<CommentVo> commentList, bool isloading}) {
    return DynamicState(
        commentList: commentList ?? this.commentList,
        isloading: isloading ?? this.isloading);
  }

  DynamicState.initialState()
      : this.commentList = [],
        this.isloading = true;
}
