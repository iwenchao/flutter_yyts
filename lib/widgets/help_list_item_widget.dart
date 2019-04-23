import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/enums.dart';
import 'package:flutter_yyts/models/help_info.dart';
import 'package:flutter_yyts/widgets/tag_widget.dart';
import 'package:flutter_yyts/widgets/user_info_widget.dart';

class HelpListItemView extends StatelessWidget {
  final HelpVo helpVo;

  const HelpListItemView({Key key, this.helpVo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> trailing = [];
    if (helpVo.resourceCnname != null) {
      trailing = [
        TagView(
          text: helpVo.resourceCnname,
          color: Colors.blue,
          border: true,
        )
      ];
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UserInfoView(
            userLevelEnum: UserLevelEnum.superVip,
            nickName: helpVo.nickname,
            avatar: helpVo.userpic,
            groudName: helpVo.groupName,
            time: helpVo.dateline,
            trailing: trailing,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            helpVo.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              helpVo.detail,
              style: TextStyle(height: 1.2, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
