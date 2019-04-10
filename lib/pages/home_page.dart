import 'package:flutter/material.dart';
import 'package:flutter_yyts/widgets/app_drawer.dart';
import 'package:flutter_yyts/widgets/search_bar.dart';

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
        appBar: AppBar(
          elevation: 0.0,
          title: GestureDetector(
            child: SearchBar(
              enabled: false,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                child: Text(DateTime.now().day.toString()),
              ),
            )
          ],
        ),
        body: Center(
          child: Text("hahahah"),
        ));
  }
}
