import 'package:flutter_yyts/models/resource_info.dart';

class CommentVo {
  String id;
  String channel;
  String author;
  ResourceVo resourceInfo;
  String userpic;
  String source;
  String groupName;
  String good;
  String dateline;
  int goodStatus;
  String channelCn;
  String itemid;
  String replyNum;
  String nickname;
  String content;

  CommentVo(
      {this.id,
      this.channel,
      this.author,
      this.resourceInfo,
      this.userpic,
      this.source,
      this.groupName,
      this.good,
      this.dateline,
      this.goodStatus,
      this.channelCn,
      this.itemid,
      this.replyNum,
      this.nickname,
      this.content});

  CommentVo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    channel = json['channel'];
    author = json['author'];
    resourceInfo = json['resource_info'] != null
        ? new ResourceVo.fromJson(json['resource_info'])
        : null;
    userpic = json['userpic'];
    source = json['source'];
    groupName = json['group_name'];
    good = json['good'];
    dateline = json['dateline'];
    goodStatus = json['good_status'];
    channelCn = json['channel_cn'];
    itemid = json['itemid'];
    replyNum = json['reply_num'];
    nickname = json['nickname'];
    content = json['content'];
  }
}
