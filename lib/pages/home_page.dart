import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_yyts/api/api.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/home_vm.dart';
import 'package:flutter_yyts/widgets/app_drawer_widget.dart';
import 'package:flutter_yyts/widgets/article_view_widget.dart';
import 'package:flutter_yyts/widgets/home_banner_widget.dart';
import 'package:flutter_yyts/widgets/search_bar_widget.dart';
import 'package:flutter_yyts/widgets/section_divider_widget.dart';
import 'package:flutter_yyts/widgets/section_title_widget.dart';
import 'package:flutter_yyts/widgets/today_broadcast_widget.dart';

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
    RestfulApi.fetchBanners();
    RestfulApi.fetchSchedule();
  }

  @override
  Widget build(BuildContext context) {
    //这里需要构建整个页面ui
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: AppDrawerView(),
        appBar: AppBar(
          elevation: 0.0,
          title: GestureDetector(
            child: SearchBarView(
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
        body: StoreConnector<ReduxState, HomeViewModel>(
          converter: (store) => HomeViewModel(store),
          builder: (context, vm) {
            return Container(
                child: vm.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        child: ListView(
                          primary: true,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: vm.ads.isNotEmpty
                                  ? HomeBannerView(ads: vm.ads)
                                  : Container(
                                      child: Center(
                                        child: Text("哈哈哈"),
                                      ),
                                    ),
                            ),
                            SectionTitleView(
                              title: "今日播出",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: vm.schedules.isNotEmpty
                                  ? TodayBroadcastView(
                                      schedules: vm.schedules,
                                    )
                                  : Container(
                                      child: Center(
                                      child: Text("哈哈哈"),
                                    )),
                            ),
                            SectionDividerView(),
                            vm.articles.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: vm.articles.length,
                                    itemBuilder: (context, index) {
                                      return ArticleView();
                                    },
                                  )
                                : Container()
                          ],
                        ),
                      ));
          },
        ));
  }
}
