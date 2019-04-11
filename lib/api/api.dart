import 'dart:convert';
import 'package:flutter_yyts/models/ad.dart';
import 'package:flutter_yyts/redux/actions/home.dart';
import 'package:flutter_yyts/redux/vm/main.dart';
import 'package:http/http.dart' as http;

class RestfulApi {
  /// 获取home页面的banner数据
  static fetchBanners() async {
    final url = "http://ctrl.zmzapi.net/app/ads?platform=7&ver=252";
    var response = await http.get(url);
    List adMap = json.decode(response.body)["ads"];
    List<Ad> adList = adMap.map((v) => Ad.fromJson(v)).toList();
    StoreContainer.global.dispatch(UpdateAds(payload: adList));
  }
}
