import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/dynamic_vm.dart';

class HelpListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReduxState, DynamicViewModel>(
      converter: (store) => DynamicViewModel(store),
      builder: (context, vm) {
        return vm.isloading
            ? CircularProgressIndicator()
            : ListView.separated(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                      height: 1,
                      indent: 0,
                    ),
                itemCount: vm.helpList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      child: Text("hahahha"),
                    ),
                  );
                },
              );
      },
    );
  }
}
