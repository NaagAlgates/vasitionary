import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          //color: COLOR_APPBAR,
          image: new DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.29), BlendMode.multiply),
            image: new AssetImage("assets/images/app_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
