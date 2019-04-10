import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_yyts/pages/home_page.dart';
import 'package:flutter_yyts/redux/states/main.dart';
import 'package:flutter_yyts/redux/vm/profile.dart';
import 'package:flutter_yyts/widgets/gradient_tag.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReduxState, ProfileViewModel>(
      converter: (store) => ProfileViewModel(store),
      builder: (context, vm) {
        return Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/drawer_bg.jpeg")),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(vm.profile.userpic ??
                      "http://popeyelau.qiniudn.com/popeye.png"),
                ),
                accountEmail: Text(vm.profile.email ?? "iwenchaos@gmail.com"),
                accountName: Row(
                  children: <Widget>[
                    Text(vm.profile.nickname ?? "chaos"),
                    SizedBox(
                      width: 8,
                    ),
                    GradientTag(
                      title: vm.profile.groupName ?? "至尊会员",
                      gradient:
                          LinearGradient(colors: [Colors.orange, Colors.red]),
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(
                  Icons.comment,
                  color: Colors.orangeAccent,
                ),
                title: Text("我的评论"),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(
                  Icons.star,
                  color: Colors.redAccent,
                ),
                title: Text("我的收藏"),
              ),
              ListTile(
                //这里的设置先引导到home页面
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
                title: Text("设置"),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pop(),
                leading: Icon(
                  Icons.help,
                  color: Colors.purple,
                ),
                title: Text("帮助"),
              )
            ],
          ),
        );
      },
    );
  }
}
