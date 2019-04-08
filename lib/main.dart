import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yyts/pages/tab_pages.dart';
import 'package:flutter_yyts/redux/states/ReduxState.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  final Store<ReduxState> store = StorContainer.global;
  runApp(MyApp(store: store))
}

class MyApp extends StatelessWidget {
  final Store<ReduxState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ReduxState>(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.black,
              textTheme: TextTheme(
                body1: TextStyle(fontSize: 15, color: Colors.black87),
                body2: TextStyle(fontSize: 13, color: Colors.grey),
                caption: TextStyle(fontSize: 10, color: Colors.grey),
                display1: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              )),
          home: TabPage(),
        ));
  }
}
