import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_yyts/models/comment_info.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/dynamic_vm.dart';
import 'package:flutter_yyts/widgets/hot_comment_list_item_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommentListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReduxState, DynamicViewModel>(
      converter: (store) => DynamicViewModel(store),
      builder: (context, vm) {
        return vm.isloading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                      height: 1,
                      indent: 0,
                    ),
                itemCount: vm.commentList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "这里需要点击事件",
                            gravity: ToastGravity.CENTER,
                            toastLength: Toast.LENGTH_SHORT);
                      },
                      child:
                          CommentListItemView(commentVo: vm.commentList[index]),
                    ),
                  );
                },
              );
      },
    );
  }
}
