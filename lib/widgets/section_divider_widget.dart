import 'package:flutter/material.dart';

class SectionDividerView extends StatelessWidget {
  final num height;
  final Color color;

  SectionDividerView({Key key, this.height, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 8.0,
      color: color ?? Colors.grey[100],
    );
  }
}
