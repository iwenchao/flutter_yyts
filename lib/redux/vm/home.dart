import 'package:flutter_yyts/models/ad.dart';
import 'package:flutter_yyts/models/article.dart';
import 'package:flutter_yyts/models/tv_schedule.dart';
import 'package:flutter_yyts/redux/states/main.dart';
import 'package:flutter_yyts/redux/vm/main.dart';
import 'package:redux/src/store.dart';

class HomeViewModel extends ViewModel {
  HomeViewModel(Store<ReduxState> store) : super(store);

  List<TVSchedule> get schedules => this.store.state.home.schedules;

  List<Article> get articles => this.store.state.home.articles;

  List<Ad> get ads => this.store.state.home.ads;

  bool get isLoading => this.store.state.home.isLoading;
}
