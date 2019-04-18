class Resource {
  String id;
  String cnname;
  String enname;
  String playStatus;
  String channel;
  String channelCn;
  String category;
  String area;
  String poster;
  String posterM;

  Resource(
      {this.id,
      this.cnname,
      this.enname,
      this.playStatus,
      this.channel,
      this.channelCn,
      this.category,
      this.area,
      this.poster});

  Resource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cnname = json['cnname'];
    enname = json['enname'];
    playStatus = json['play_status'];
    channel = json['channel'];
    channelCn = json['channel_cn'];
    category = json['category'];
    area = json['area'];
    poster = json['poster'];
    posterM = json['poster_m'];
  }
}
