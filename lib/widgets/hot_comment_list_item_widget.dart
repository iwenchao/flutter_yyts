import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/comment_info.dart';
import 'package:flutter_yyts/models/enums.dart';
import 'package:flutter_yyts/pages/video_page.dart';
import 'package:flutter_yyts/widgets/icon_label_widget.dart';
import 'package:flutter_yyts/widgets/resource_link_widget.dart';
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
            children: <Widget>[
              IconLabelView(
                icon: Icons.comment,
                title: commentVo.replyNum,
              ),
              SizedBox(
                width: 50,
              ),
              IconLabelView(
                icon: Icons.thumb_up,
                title: commentVo.good,
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            child: ResourceLinkView(
              resourceVo: commentVo.resourceInfo,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => VideoPage()));
            },
          )
        ],
      ),
    );
  }
}
