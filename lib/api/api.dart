import 'dart:convert';
import 'package:flutter_yyts/models/ad.dart';
import 'package:flutter_yyts/models/tv_schedule.dart';
import 'package:flutter_yyts/redux/actions/home.dart';
import 'package:flutter_yyts/redux/vm/main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RestfulApi {
  /// 获取home页面的banner数据
  static fetchBanners() async {
    final url = "http://ctrl.zmzapi.net/app/ads?platform=7&ver=252";
    var response = await http.get(url);
    List adMap = json.decode(response.body)["ads"];
    List<Ad> adList = adMap.map((v) => Ad.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateAds(payload: adList));
  }

  static fetchSchedule() async {
    final today = DateTime.now();
    final formatter = DateFormat("yyyy-MM-dd");
    final start = formatter.format(today);
    final end = formatter.format(today.add(Duration(days: 1)));

    final url =
        "http://ios.zmzapi.com/index.php?accesskey=519f9cab85c8059d17544947k361a827&client=1&g=api/v3&m=index&a=tv_schedule&end=$end&start=$start";
    var response = await http.get(url);
    Map<String, dynamic> map = json.decode(response.body)["data"];
    List<TVSchedule> list = [];
    map.keys.forEach((key) {
      list.addAll(
          (map[key] as List).map((v) => TVSchedule.fromJson(v)).toList());
    });
    StoreContainer.global.dispatch(UpdateTVSchedule(payload: list));
  }
}
