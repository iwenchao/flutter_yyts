import 'package:flutter_yyts/models/tv_schedule.dart';
import 'package:flutter_yyts/redux/actions/main.dart';

class UpdateTVSchedule extends ActionType {
  final List<TVSchedule> payload;

  UpdateTVSchedule({this.payload}) : super(payload: payload);
}
