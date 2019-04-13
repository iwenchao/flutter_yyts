import 'package:flutter_yyts/models/ad_info.dart';
import 'package:flutter_yyts/models/article_info.dart';
import 'package:flutter_yyts/models/tv_schedule_info.dart';
import 'package:flutter_yyts/redux/actions/main_action.dart';

class UpdateTVScheduleAction extends ActionType {
  final List<TVScheduleVo> payload;

  UpdateTVScheduleAction({this.payload}) : super(payload: payload);
}

class UpdateAdsAction extends ActionType {
  final List<AdVo> payload;

  UpdateAdsAction({this.payload}) : super(payload: payload);
}

class UpdateArticleAction extends ActionType {
  final List<ArticleVo> payload;

  UpdateArticleAction({this.payload}) : super(payload: payload);
}
