import 'package:flutter_yyts/models/lib_resource_info.dart';
import 'package:flutter_yyts/models/resource_category_info.dart';
import 'package:flutter_yyts/redux/actions/main_action.dart';

class UpdateLibResourceListAction extends ActionType {
  final List<LibResourceVo> payload;

  UpdateLibResourceListAction({this.payload}) : super(payload: payload);
}

class UpdateFiltedResourceListAction extends ActionType {
  final List<LibResourceVo> payload;

  UpdateFiltedResourceListAction({this.payload}) : super(payload: payload);
}

class UpdateResourceCategoryAction extends ActionType {
  final ResourceCategoryVo payload;

  UpdateResourceCategoryAction({this.payload}) : super(payload: payload);
}
