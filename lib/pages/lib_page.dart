import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_yyts/api/api.dart';
import 'package:flutter_yyts/models/menu_info.dart';
import 'package:flutter_yyts/models/sort_info.dart';
import 'package:flutter_yyts/pages/search_page.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/lib_vm.dart';
import 'package:flutter_yyts/widgets/grid_menus_widget.dart';
import 'package:flutter_yyts/widgets/search_bar_widget.dart';
import 'package:flutter_yyts/widgets/sort_bar_widget.dart';

class LibPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LibPageState();
  }
}

class _LibPageState extends State<LibPage> {
  @override
  void initState() {
    super.initState();
    //获取片库资源数据
    RestfulApi.fetchLibList();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: GestureDetector(
          child: SearchBarView(
            enabled: false,
          ),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SearchPage()));
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            GridMenuView(
              callback: (MenuVo menu) {},
            ),
            SortBarView(
              callback: (SortVo vo) {},
            ),
            StoreConnector<ReduxState, LibViewModel>(
              converter: (store) => LibViewModel(store),
              builder: (context, vm) {
                return Container(
                  child: Text(
                    "哈哈,这里是列表啊；\n 你等我一下，让我写完哦",
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
