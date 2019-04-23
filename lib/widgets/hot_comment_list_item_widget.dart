import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/comment_info.dart';
import 'package:flutter_yyts/models/enums.dart';
import 'package:flutter_yyts/widgets/tag_widget.dart';
import 'package:flutter_yyts/widgets/user_info_widget.dart';

class CommentListItemView extends StatelessWidget {
  final CommentVo commentVo;

  const CommentListItemView({Key key, this.commentVo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserInfoView(
            userLevelEnum: UserLevelEnum.superVip,
            nickName: commentVo.nickname,
            avatar: commentVo.userpic,
            groudName: commentVo.groupName,
            time: commentVo.dateline,
            trailing: <Widget>[
              TagView(
                text: commentVo.channelCn,
                color: Theme.of(context).primaryColor,
                border: true,
              )
            ],
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
