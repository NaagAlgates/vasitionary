import 'package:flutter/material.dart';
import 'helper/constants.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(APPLICATION_NAME),
          backgroundColor: APPBAR_COLOR,
        ),
        body: new Center(
          child: new Text(APPLICATION_NAME),
        ),
      ),
    );
  }
}