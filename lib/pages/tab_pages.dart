import 'package:flutter/material.dart';
import 'package:flutter_yyts/pages/home_page.dart';
import 'package:flutter_yyts/widgets/tab_bar_item.dart';

class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TabPageState();
  }
}

class TabPageState extends State<TabPage> with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[HomePage(), HomePage(), HomePage(), HomePage()],
      ),
      bottomNavigationBar: Material(
        color: Colors.grey[100],
        child: TabBar(
          isScrollable: false,
          indicatorColor: Colors.transparent,
          controller: _tabController,
          tabs: <Widget>[
            TabBarItem(
              text: "首页",
              icon: Icons.home,
              selected: _selectedIndex == 0,
            ),
            TabBarItem(
              text: "排行",
              icon: Icons.local_play,
              selected: _selectedIndex == 1,
            ),
            TabBarItem(
              text: "片库",
              icon: Icons.ondemand_video,
              selected: _selectedIndex == 2,
            ),
            TabBarItem(
              text: "动态",
              icon: Icons.camera,
              selected: _selectedIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}
