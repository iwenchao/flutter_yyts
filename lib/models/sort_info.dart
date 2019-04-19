class SortVo {
  final String key;
  final String text;

  SortVo({this.key, this.text});

  static List<SortVo> defaults = [
    SortVo(key: "itemupdate", text: "按更新时间"),
    SortVo(key: "views", text: "按发布日期"),
    SortVo(key: "rank", text: "按排名"),
    SortVo(key: "score", text: "按评分"),
    SortVo(key: "dateline", text: "按点击率"),
  ];
}
