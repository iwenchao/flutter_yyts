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
import 'package:flutter_yyts/widgets/video_list_item_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                return vm.isloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: vm.resourceList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "这里还需要点击事件",
                                  gravity: ToastGravity.CENTER);
                            },
                            child: VideoListItemView(
                              resouceVo: vm.resourceList[index],
                            ),
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
