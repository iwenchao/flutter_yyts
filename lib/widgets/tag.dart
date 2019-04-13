import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color color;
  final bool border;

  const Tag({Key key, this.text, this.backgroundColor, this.color, this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 120),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            border: border ? Border.all(color: color) : null),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 10, color: color),
        ),
      ),
    );
  }
}
