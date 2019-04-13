import 'package:flutter_yyts/models/profile.dart';
import 'package:flutter_yyts/redux/actions/main.dart';

class UpdateUserProfile extends ActionType {
  final Profile payload;

  UpdateUserProfile({this.payload}) : super(payload: payload);
}
