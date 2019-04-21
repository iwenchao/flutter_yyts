import 'package:flutter/material.dart';
import 'package:flutter_yyts/common/utils.dart';
import 'package:flutter_yyts/models/lib_resource_info.dart';
import 'package:flutter_yyts/widgets/tag_widget.dart';

class VideoListItemView extends StatelessWidget {
  final LibResourceVo resouceVo;

  const VideoListItemView({Key key, this.resouceVo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = "";
    int timestamp = int.tryParse(resouceVo.itemupdate);
    date = timestamp == null
        ? resouceVo.itemupdate
        : Utils.readTimestamp(timestamp);
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: resouceVo.poster ?? resouceVo.cnname,
                child: Container(
                  height: 100,
                  width: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: resouceVo.posterM == null
                                ? AssetImage("assets/images/placeholder.png")
                                : NetworkImage(resouceVo.posterM))),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          resouceVo.cnname,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      resouceVo.area.isNotEmpty
                          ? TagView(
                              text: resouceVo.area,
                              color: Theme.of(context).primaryColor,
                              border: true,
                            )
                          : Container(),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        resouceVo.category,
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Text(
                        resouceVo.playStatus,
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.body2,
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: Container(
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Score"),
                      Text(
                        resouceVo.score,
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
