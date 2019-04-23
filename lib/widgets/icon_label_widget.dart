import 'package:flutter/material.dart';

/// 图+字
class IconLabelView extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  const IconLabelView({Key key, this.title, this.color, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }
}
