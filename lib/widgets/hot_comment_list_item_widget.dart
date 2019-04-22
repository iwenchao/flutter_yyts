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
        children: <Widget>[
          Container(
            child: Text("这里是用户信息"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(commentVo.content),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
