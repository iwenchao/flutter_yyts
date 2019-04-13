import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/models/ad_info.dart';
import 'package:flutter_yyts/models/article_info.dart';
import 'package:flutter_yyts/models/tv_schedule_info.dart';
import 'package:flutter_yyts/redux/actions/home_action.dart';

@immutable
class HomeState {
  final List<TVScheduleVo> schedules;
  final List<ArticleVo> articles;
  final List<AdVo> ads;
  final bool isLoading;

  HomeState({this.schedules, this.isLoading, this.articles, this.ads});

  HomeState copyWith(
      {List<TVScheduleVo> schedules,
      bool isLoading,
      List<ArticleVo> articles,
      List<AdVo> ads}) {
    return HomeState(
        schedules: schedules ?? this.schedules,
        isLoading: isLoading ?? this.isLoading,
        articles: articles ?? this.articles,
        ads: ads ?? this.ads);
  }

  HomeState.initialState()
      : schedules = [],
        articles = [],
        ads = [],
        isLoading = true;
}
