import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/article_info.dart';
import 'package:flutter_yyts/widgets/tag_widget.dart';

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
//              Padding(
//                padding: const EdgeInsets.only(top: 8),
//                child: ActonBar(),
//              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {}
}
