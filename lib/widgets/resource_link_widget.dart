import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/resource_info.dart';

class ResourceLinkView extends StatelessWidget {
  final ResourceVo resourceVo;

  const ResourceLinkView({Key key, this.resourceVo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        leading: Hero(
          tag: resourceVo.poster,
          child: Image(
            image: NetworkImage(resourceVo.posterM),
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        title: Text(resourceVo.cnname),
        subtitle: Text(resourceVo.cnname),
      ),
    );
  }
}
