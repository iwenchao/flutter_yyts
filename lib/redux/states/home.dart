import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/models/ad.dart';
import 'package:flutter_yyts/models/article.dart';
import 'package:flutter_yyts/models/tv_schedule.dart';
import 'package:flutter_yyts/redux/actions/home.dart';

@immutable
class HomeState {
  final List<TVSchedule> schedules;
  final List<Article> articles;
  final List<Ad> ads;
  final bool isLoading;

  HomeState({this.schedules, this.isLoading, this.articles, this.ads});

  HomeState copyWith(
      {List<TVSchedule> schedules,
      bool isLoading,
      List<Article> articles,
      List<Ad> ads}) {
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
