import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/article_info.dart';
import 'package:flutter_yyts/pages/comment_page.dart';
import 'package:flutter_yyts/pages/photo_library_page.dart';
import 'package:flutter_yyts/widgets/action_bar_widget.dart';
import 'package:flutter_yyts/widgets/tag_widget.dart';
import 'package:flutter_yyts/widgets/video_player_widget.dart';

class ArticleView extends StatelessWidget {
  final ArticleViewModel vm;

  const ArticleView({Key key, this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(vm.avatar),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                vm.author,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TagView(
                                text: vm.tag,
                                border: true,
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          ),
                          Text(
                            vm.title,
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              vm.title.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        vm.title,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  vm.content,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
              Container(
                child: _buildContent(context),
              ),
              Divider(height: 1),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ActonBarView(
                  likes: vm.goodCount,
                  comments: vm.commentsCount,
                  liked: vm.liked,
                  onComment: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CommentPage()));
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    Widget child = Container();
    if (vm.isVideo) {
      //如果是视频类
      child = VideoPlayerView(
        url: vm.video,
        placeholder: vm.videoCover,
      );
    } else {
      // 如果是文本类
      final imageCount = vm.images.length;
      if (imageCount > 0) {
        child = vm.images.length > 1
            ? GridView.builder(
                itemCount: vm.images.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => PhotoLibraryPage()));
                    },
                    child: FadeInImage(
                      placeholder: AssetImage("assets/images/placeholder.png"),
                      image: NetworkImage(vm.images[index]),
                      fit: BoxFit.cover,
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
              )
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PhotoLibraryPage()));
                },
                child: Hero(
                    tag: vm.images.first,
                    child: FadeInImage(
                      placeholder: AssetImage("assets/images/placeholder.png"),
                      image: NetworkImage(vm.images.first),
                      fit: BoxFit.cover,
                    )),
              );
      }
    }
    return Container(
      child: child,
    );
  }
}
