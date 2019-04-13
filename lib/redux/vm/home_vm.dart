import 'package:flutter_yyts/models/ad_info.dart';
import 'package:flutter_yyts/models/article_info.dart';
import 'package:flutter_yyts/models/tv_schedule_info.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/main_vm.dart';
import 'package:redux/src/store.dart';

class HomeViewModel extends ViewModel {
  HomeViewModel(Store<ReduxState> store) : super(store);

  List<TVScheduleVo> get schedules => this.store.state.home.schedules;

  List<ArticleVo> get articles => this.store.state.home.articles;

  List<AdVo> get ads => this.store.state.home.ads;

  bool get isLoading => this.store.state.home.isLoading;
}
