import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/enums.dart';
import 'package:flutter_yyts/widgets/gradient_tag_widget.dart';

class UserInfoView extends StatelessWidget {
  final UserLevelEnum userLevelEnum;
  final List<Widget> trailing;
  final String avatar;
  final String nickName;
  final String groudName;
  final String time;

  UserInfoView(
      {Key key,
      this.userLevelEnum,
      this.trailing,
      this.avatar,
      this.nickName,
      this.groudName,
      this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isVip = userLevelEnum == UserLevelEnum.superVip;
    final List<Color> colors = isVip
        ? [Colors.orange, Colors.red]
        : [Colors.blue, Colors.lightBlue.withAlpha(100)];
    List<Widget> children = [
      CircleAvatar(
        backgroundImage: NetworkImage(avatar),
      ),
      SizedBox(
        width: 8,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(nickName),
          Text(
            time,
            style: Theme.of(context).textTheme.body2,
          )
        ],
      ),
      SizedBox(
        width: 8,
      ),
      GradientTagView(
        title: groudName,
        color: Colors.white,
        gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.centerRight,
            colors: colors),
      ),
    ];
    if (trailing != null) {
      children.add(Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: trailing,
      )));
    }
    return Container(
      child: Row(
        children: children,
      ),
    );
  }
}
