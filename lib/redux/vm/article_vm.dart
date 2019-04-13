import 'package:flutter_yyts/common/utils.dart';
import 'package:flutter_yyts/models/article_info.dart';
import 'package:flutter_yyts/models/article_list_info.dart';

class ArticleViewModel {
  String id;
  String author;
  String goodCount;
  String commentsCount;
  String content;
  String title;
  String avatar;
  List<String> images;
  String video;
  String videoCover;
  String tag;
  bool liked;
  String time;
  String cid;

  ArticleViewModel.fromArticle(ArticleVo article) {
    id = article.id;
    author = article.username ?? article.authorName;
    goodCount = article.good;
    commentsCount = article.commentsCount;
    content = article.content ?? article.intro;
    title = article.title ?? "";
    avatar = article.userLogo ?? article.userpic;
    video = article.video720 ?? "";
    videoCover = article.cover ?? "";
    tag = article.typeCn ?? "";
    liked = article.goodStatus == 1;
    if (article.dateline != null) {
      time = Utils.readTimestamp(int.parse(article.dateline));
    } else {
      time = Utils.readTimestamp(int.parse(article.time));
    }
    cid = article.mid;

    if (isVideo) {
      images = [];
    } else if (article.type == "news" ||
        article.type == "t_review" ||
        article.type == "m_review" ||
        article.type == "new_review" ||
        article.type == "recom") {
      images = [article.posterB];
    } else {
      images = article.imgs.map((i) => i.url).toList() ?? [];
    }
  }

  ArticleViewModel.fromVideoArticle(ArticleListVo article) {
    id = article.id;
    author = article.authorName;
    goodCount = article.good;
    commentsCount = article.commentsCount;
    content = article.intro;
    title = article.title ?? "";
    avatar = article.userpic;
    video = "";
    videoCover = "";
    tag = article.typeCn ?? "";
    liked = article.goodStatus == 1;
    images = [];

    time = article.dateline ?? "";
    if (article.poster.isNotEmpty) {
      images = [article.poster];
    }
  }

  bool get isVideo {
    return video.isNotEmpty;
  }
}
