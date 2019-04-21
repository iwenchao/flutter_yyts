import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/resource_info.dart';
import 'package:flutter_yyts/widgets/tag_widget.dart';

class VideoGridItem extends StatelessWidget {
  final ResourceVo resource;

  VideoGridItem({Key key, this.resource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                elevation: 8,
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Hero(
                    tag: resource.poster,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(resource.poster ??
                          "http://renren2.maoyun.tv/apptu/1554741804331_7765.jpg"),
                      placeholder: AssetImage("assets/images/placeholder.png"),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                resource.cnname,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              resource.playStatus,
              style: Theme.of(context).textTheme.body2,
            ),
            resource.channelCn != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TagView(
                      text: resource.channelCn,
                      color: Theme.of(context).primaryColor,
                      border: true,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
