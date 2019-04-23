import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoPageState();
  }

  VideoPage({Key key}) : super(key: key);
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("这里将会播放视频哦"),
    ));
  }
}
