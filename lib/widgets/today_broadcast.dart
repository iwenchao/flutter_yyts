import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/tv_schedule.dart';
import 'package:flutter_yyts/pages/home_page.dart';
import 'package:flutter_yyts/widgets/tag.dart';

class TodayBroadcast extends StatelessWidget {
  final List<TVSchedule> schedules;

  const TodayBroadcast({Key key, this.schedules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final item = schedules[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Card(
              margin: EdgeInsets.zero,
              child: GridTile(
                child: Hero(
                  tag: item.poster,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage("assets/images/placeholder.png"),
                    image: NetworkImage(item.poster),
                  ),
                ),
                header: GridTileBar(
                  leading: item.statusCn.isNotEmpty
                      ? Tag(
                          text: item.statusCn,
                          color: Colors.white,
                          backgroundColor:
                              Theme.of(context).primaryColorDark.withAlpha(200),
                        )
                      : Container(),
                ),
                footer: Container(
                  height: 40,
                  child: GridTileBar(
                    title: Text(
                      item.cnname,
                      style: TextStyle(fontSize: 12),
                    ),
                    backgroundColor: Colors.black.withAlpha(120),
                    subtitle: Text(
                      "S${item.season.padLeft(2, '0')}E${item.episode.padLeft(2, '0')}",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 1.2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 8),
      ),
    );
  }
}
