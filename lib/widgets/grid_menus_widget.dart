import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/menu_info.dart';
import 'package:flutter_yyts/widgets/grid_menu_item_widget.dart';

class GridMenuView extends StatelessWidget {
  final Function callback;

  GridMenuView({Key key, this.callback}) : super(key: key);

  final List<MenuVo> menu = [
    MenuVo(title: "电影", icon: "电影", channel: "movie"),
    MenuVo(title: "美剧", icon: "美剧", channel: "tv", area: "美国"),
    MenuVo(title: "英剧", icon: "英剧", channel: "tv", area: "英国"),
    MenuVo(title: "日剧", icon: "日剧", channel: "tv", area: "日本"),
    MenuVo(title: "韩剧", icon: "韩剧", channel: "tv", area: "韩国"),
    MenuVo(title: "其他语种", icon: "其他语种", channel: "tv"),
    MenuVo(title: "公开课", icon: "公开课", channel: "openclass"),
    MenuVo(title: "纪录片", icon: "纪录片", channel: "documentary"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GridView.builder(
            itemCount: menu.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final border = BorderSide(color: Colors.grey[200]);
              return Container(
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        top: border,
                        start: border,
                        end: (index % 4) == 3 ? border : BorderSide.none)),
                child: GridMenuItemView(
                  menu: menu[index],
                  callback: callback,
                ),
              );
            },
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
          )
        ],
      ),
    );
  }
}
