import 'package:flutter_yyts/models/profile_info.dart';
import 'package:flutter_yyts/redux/actions/main_action.dart';

class UpdateUserProfileAction extends ActionType {
  final ProfileVo payload;

  UpdateUserProfileAction({this.payload}) : super(payload: payload);
}
