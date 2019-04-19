import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/menu_info.dart';

class GridMenuItemView extends StatelessWidget {
  final MenuVo menu;

  final Function callback;

  GridMenuItemView({Key key, this.menu, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          callback(menu);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/images/${menu.icon}.png",
                width: 30,
                height: 30,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                menu.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.body2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
