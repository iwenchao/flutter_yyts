import 'package:flutter/material.dart';

class GradientTagView extends StatelessWidget {
  final Color color;
  final String title;
  final Gradient gradient;

  GradientTagView({Key key, this.color, this.title, this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: gradient,
      ),
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: 10),
      ),
    );
  }
}
