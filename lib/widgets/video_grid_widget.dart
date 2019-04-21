import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/resource_info.dart';
import 'package:flutter_yyts/widgets/video_grid_item_widget.dart';

class VideoGridView extends StatelessWidget {
  final List<ResourceVo> resources;

  VideoGridView({Key key, this.resources}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GridView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: resources.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 9 / 18,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8),
          itemBuilder: (context, index) {
            return VideoGridItem(resource: resources[index]);
          }),
    );
  }
}
