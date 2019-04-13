import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  final num height;
  final Color color;

  SectionDivider({Key key, this.height, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 8.0,
      color: color ?? Colors.grey[100],
    );
  }
}
