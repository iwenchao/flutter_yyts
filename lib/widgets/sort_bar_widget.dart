import 'package:flutter/material.dart';
import 'package:flutter_yyts/models/sort_info.dart';
import 'package:flutter_yyts/widgets/section_title_widget.dart';

class SortBarView extends StatefulWidget {
  final Function callback;

  SortBarView({Key key, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SortBarViewState();
  }
}

class _SortBarViewState extends State<SortBarView> {
  SortVo sortVo = SortVo.defaults.first;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SectionTitleView(
              title: sortVo.text,
            ),
            Icon(Icons.sort_by_alpha)
          ],
        ),
        onSelected: (SortVo vo) {
          setState(() {
            sortVo = vo;
          });
          widget.callback(vo);
        },
        itemBuilder: (context) {
          return SortVo.defaults
              .map((value) => PopupMenuItem(
                    key: Key(value.key),
                    value: value,
                    child: Text(value.text),
                  ))
              .toList();
        },
      ),
    );
  }
}
