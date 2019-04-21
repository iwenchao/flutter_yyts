class ResourceCategoryVo {
  List<String> category;
  List<String> year;
  List<String> tv;

  ResourceCategoryVo({this.category, this.year, this.tv});

  ResourceCategoryVo.initialState() {
    category = [];
    year = [];
    tv = [];
  }

  ResourceCategoryVo.fromJson(Map<String, dynamic> json) {
    category = (json['category'] as List).map((i) => i.toString()).toList();
    year = (json['year'] as List).map((i) => i.toString()).toList();
    tv = (json['tv'] as List).map((i) => i.toString()).toList();
  }
}
