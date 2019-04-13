import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_yyts/api/api.dart';
import 'package:flutter_yyts/redux/states/main.dart';
import 'package:flutter_yyts/redux/vm/home.dart';
import 'package:flutter_yyts/widgets/app_drawer.dart';
import 'package:flutter_yyts/widgets/home_banner.dart';
import 'package:flutter_yyts/widgets/search_bar.dart';
import 'package:flutter_yyts/widgets/section_title.dart';
import 'package:flutter_yyts/widgets/today_broadcast.dart';

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
                                  ? HomeBanner(ads: vm.ads)
                                  : Container(
                                      child: Center(
                                        child: Text("哈哈哈"),
                                      ),
                                    ),
                            ),
                            SectionTitle(
                              title: "今日播出",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: vm.schedules.isNotEmpty
                                  ? TodayBroadcast(
                                      schedules: vm.schedules,
                                    )
                                  : Container(
                                      child: Center(
                                      child: Text("哈哈哈"),
                                    )),
                            ),
                          ],
                        ),
                      ));
          },
        ));
  }
}
