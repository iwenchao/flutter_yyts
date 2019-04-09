import 'package:flutter/material.dart';
import 'package:flutter_yyts/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int sliderIndex = 0;

  @override
  void initState() {
    super.initState();
    //这里需要进行网络获取数据
  }

  @override
  Widget build(BuildContext context) {
    //这里需要构建整个页面ui
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: AppDrawer(),
        body: new Text("哈哈哈"));
  }
}
