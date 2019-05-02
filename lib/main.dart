import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vasitionary/ui/homescreen.dart';
import 'package:vasitionary/ui/login_home.dart';
import 'helper/constants.dart';
import 'package:vasitionary/ui/homepage.dart';

void main() {
  // Full screen UI
  //SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
          textSelectionColor: COLOR_APPBAR, cursorColor: COLOR_APPBAR),
      debugShowCheckedModeBanner: false,
      title: TITLE_MAIN_PAGE,
      home: LoginActivity(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  HomePage createState() => HomePage();
}
