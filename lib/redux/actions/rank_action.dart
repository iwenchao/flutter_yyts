import 'package:flutter_yyts/models/ranks_info.dart';
import 'package:flutter_yyts/redux/actions/main_action.dart';

class UpdateTopRanksAction extends ActionType {
  final Ranks payload;
  final bool isloading;

  UpdateTopRanksAction({this.payload, this.isloading})
      : super(payload: payload);
}
