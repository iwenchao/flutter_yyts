import 'package:flutter/foundation.dart';
import 'package:flutter_yyts/models/lib_resource_info.dart';
import 'package:flutter_yyts/models/resource_category_info.dart';

@immutable
class LibState {
  final List<LibResourceVo> resourceList;
  final List<LibResourceVo> filtedResourceList;
  final ResourceCategoryVo category;
  final bool isloading;

  LibState(
      {this.resourceList,
      this.filtedResourceList,
      this.category,
      this.isloading});

  LibState copyWith(
      {List<LibResourceVo> resources,
      List<LibResourceVo> filtedResources,
      ResourceCategoryVo category,
      bool isloading}) {
    return LibState(
        resourceList: resources ?? this.resourceList,
        filtedResourceList: filtedResources ?? this.filtedResourceList,
        category: category ?? this.category,
        isloading: isloading ?? this.isloading);
  }

  LibState.initialState()
      : this.resourceList = [],
        this.filtedResourceList = [],
        this.category = ResourceCategoryVo.initialState(),
        this.isloading = true;
}
