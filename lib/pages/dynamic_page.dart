import 'package:flutter/material.dart';
import 'package:flutter_yyts/api/api.dart';
import 'package:flutter_yyts/widgets/hot_comment_list_widget.dart';

class DynamicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DynamicPageState();
  }
}

class _DynamicPageState extends State<DynamicPage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    RestfulApi.fetchHotCommentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("动态"),
        bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            controller: controller,
            tabs: <Widget>[
              Tab(
                text: "热评",
              ),
              Tab(
                text: "求助",
              )
            ]),
      ),
      body: Container(
        child: TabBarView(
          controller: controller,
          children: <Widget>[
            CommentListView(),
          ],
        ),
      ),
    );
  }
}
