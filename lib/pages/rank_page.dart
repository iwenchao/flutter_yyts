import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_yyts/api/api.dart';
import 'package:flutter_yyts/pages/search_page.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/rank_vm.dart';
import 'package:flutter_yyts/widgets/search_bar_widget.dart';
import 'package:flutter_yyts/widgets/video_grid_widget.dart';

///排行榜页面
class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() {
    return _RankPageState();
  }
}

class _RankPageState extends State<RankPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  final List<String> tabs = ["今日", "本月", "日剧", "电影", "新剧", "总榜"];

  @override
  void initState() {
    super.initState();

    controller = TabController(length: tabs.length, vsync: this);
    RestfulApi.fetchRankList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        bottom: TabBar(
          tabs: tabs.map((title) => Tab(text: title)).toList(),
          controller: controller,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
        ),
      ),
      body: Container(
        child: StoreConnector<ReduxState, RankViewModel>(
          converter: (store) => RankViewModel(store),
          builder: (context, vm) {
            return TabBarView(
              controller: controller,
              children: <Widget>[
                vm.isloading
                    ? Center(child: CircularProgressIndicator())
                    : VideoGridView(resources: vm.ranks.today),
                VideoGridView(resources: vm.ranks?.month),
                VideoGridView(resources: vm.ranks?.japan),
                VideoGridView(resources: vm.ranks?.movie),
                VideoGridView(resources: vm.ranks?.news),
                VideoGridView(resources: vm.ranks?.total)
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
