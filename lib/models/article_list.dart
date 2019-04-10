class ArticleList {
  String id;
  String intro;
  String commentsCount;
  String typeCn;
  String author;
  String userpic;
  String type;
  String title;
  String good;
  String dateline;
  String groupName;
  int goodStatus;
  String poster;
  String authorName;
  String posterB;
  String posterM;
  String posterS;
  String views;

  ArticleList(
      {this.id,
      this.intro,
      this.commentsCount,
      this.typeCn,
      this.author,
      this.userpic,
      this.type,
      this.title,
      this.good,
      this.dateline,
      this.groupName,
      this.goodStatus,
      this.poster,
      this.authorName,
      this.posterB,
      this.posterM,
      this.posterS,
      this.views});

  ArticleList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    intro = json['intro'];
    commentsCount = json['comments_count'].toString();
    typeCn = json['type_cn'];
    author = json['author'];
    userpic = json['userpic'];
    type = json['type'];
    title = json['title'];
    good = json['good'];
    dateline = json['dateline'];
    groupName = json['group_name'];
    goodStatus = json['good_status'];
    poster = json['poster'];
    authorName = json['author_name'];
    posterB = json['poster_b'];
    posterM = json['poster_m'];
    posterS = json['poster_s'];
    views = json['views'];
  }
}
