import 'dart:convert';
import 'package:flutter_yyts/models/ad_info.dart';
import 'package:flutter_yyts/models/article_info.dart';
import 'package:flutter_yyts/models/lib_resource_info.dart';
import 'package:flutter_yyts/models/profile_info.dart';
import 'package:flutter_yyts/models/ranks_info.dart';
import 'package:flutter_yyts/models/tv_schedule_info.dart';
import 'package:flutter_yyts/redux/actions/home_action.dart';
import 'package:flutter_yyts/redux/actions/lib_actions.dart';
import 'package:flutter_yyts/redux/actions/profile_action.dart';
import 'package:flutter_yyts/redux/actions/rank_action.dart';
import 'package:flutter_yyts/redux/vm/main_vm.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RestfulApi {
  /// 获取home页面的banner数据
  static fetchBanners() async {
    final url = "http://ctrl.zmzapi.net/app/ads?platform=7&ver=252";
    var response = await http.get(url);
    List adMap = json.decode(response.body)["ads"];
    List<AdVo> adList = adMap.map((v) => AdVo.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateAdsAction(payload: adList));
  }

  /// 获取今日广播
  static fetchSchedule() async {
    final today = DateTime.now();
    final formatter = DateFormat("yyyy-MM-dd");
    final start = formatter.format(today);
    final end = formatter.format(today.add(Duration(days: 1)));

    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=tv_schedule&end=$end&start=$start";
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body)["data"];
    List<TVScheduleVo> list = [];
    map.keys.forEach((key) {
      list.addAll(
          (map[key] as List).map((v) => TVScheduleVo.fromJson(v)).toList());
    });
    StoreContainer.global.dispatch(UpdateTVScheduleAction(payload: list));
  }

  static fetchArticleList() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=article_list&page=0&token=edc3c80aed456c1266237e555b5bf218&uid=5704761";
    var response = await http.get(url);
    List map = json.decode(response.body)["data"];
    List<ArticleVo> list = [];
    list = map.map((v) => ArticleVo.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateArticleAction(payload: list));
  }

  /// 获取用户信息
  static fetchUserProfile() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=login&account=popeyelau%40gmail.com&did=2A2B9DE8-5038-4FBE-8ECB-DD86D3301FB1&password=Yyets123456&registration_id=141fe1da9efde137552";
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body)["data"];
    ProfileVo profileVo = ProfileVo.fromJson(map);
    StoreContainer.global.dispatch(UpdateUserProfileAction(payload: profileVo));
  }

  ///获取排行榜数据
  static fetchRankList() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=hot&limit=30";
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body)["data"];
    Ranks ranks = Ranks.fromJson(map);
    StoreContainer.global
        .dispatch(UpdateTopRanksAction(payload: ranks, isloading: false));
  }

  static fetchLibList() async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=resource_storage&page=1";
    var response = await http.get(url);
    List map = json.decode(response.body)["data"];
    List<LibResourceVo> list = [];
    list = map.map((v) => LibResourceVo.fromJson(v)).toList();

    StoreContainer.global.dispatch(UpdateLibResourceListAction(payload: list));
  }

  static fetchLibResourceList(
      {String category = "",
      String tv = "",
      String year = "",
      String channel = "",
      String area = "",
      String sort = "itemupdate"}) async {
    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=resource_storage&area=$area&category=$category&channel=$channel&order=$sort&page=1&tv=$tv&year=$year";
    var response = await http.get(url);
    List map = json.decode(response.body)["data"];
    List<LibResourceVo> list = [];
    list = map.map((value) => LibResourceVo.fromJson(value)).toList();
    StoreContainer.global
        .dispatch(UpdateFiltedResourceListAction(payload: list));
  }
}
