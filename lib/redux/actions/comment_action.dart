import 'package:flutter_yyts/models/comment_info.dart';
import 'package:flutter_yyts/redux/actions/main_action.dart';

class UpdateCommentListAction extends ActionType {
  final List<CommentVo> payload;

  UpdateCommentListAction(this.payload) : super(payload: payload);
}
