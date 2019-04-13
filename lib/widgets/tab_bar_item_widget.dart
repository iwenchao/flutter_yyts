import 'package:flutter/material.dart';

class TabBarItemView extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;

  TabBarItemView({this.icon, this.text, this.selected});

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).primaryColor;
    final Color normalColor = Colors.grey[400];

    return Container(
      height: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            icon,
            color: selected ? selectedColor : normalColor,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 11, color: selected ? selectedColor : normalColor),
          )
        ],
      ),
    );
  }
}
