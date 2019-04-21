import 'package:flutter_yyts/models/resource_info.dart';

class Ranks {
  List<ResourceVo> month;
  List<ResourceVo> japan;
  List<ResourceVo> movie;
  List<ResourceVo> total;
  List<ResourceVo> news;
  List<ResourceVo> today;

  Ranks.initialState() {
    month = [];
    japan = [];
    movie = [];
    total = [];
    news = [];
    today = [];
  }

  Ranks.fromJson(Map<String, dynamic> json) {
    if (json['month_list'] != null) {
      month = List<ResourceVo>();
      json['month_list'].forEach((v) {
        month.add(ResourceVo.fromJson(v));
      });
    }
    if (json['japan_list'] != null) {
      japan = List<ResourceVo>();
      json['japan_list'].forEach((v) {
        japan.add(ResourceVo.fromJson(v));
      });
    }

    if (json['movie_list'] != null) {
      movie = List<ResourceVo>();
      json['movie_list'].forEach((v) {
        movie.add(ResourceVo.fromJson(v));
      });
    }
    if (json['total_list'] != null) {
      total = List<ResourceVo>();
      json['total_list'].forEach((v) {
        total.add(ResourceVo.fromJson(v));
      });
    }
    if (json['new_list'] != null) {
      news = List<ResourceVo>();
      json['new_list'].forEach((v) {
        news.add(ResourceVo.fromJson(v));
      });
    }
    if (json['today_list'] != null) {
      today = List<ResourceVo>();
      json['today_list'].forEach((v) {
        today.add(ResourceVo.fromJson(v));
      });
    }
  }
}
