import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/comment_info.dart';

class CommentListItemView extends StatelessWidget {
  final CommentVo commentVo;

  const CommentListItemView({Key key, this.commentVo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[],
      ),
    );
  }
}
