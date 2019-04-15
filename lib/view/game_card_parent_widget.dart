import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/view/game_card.dart';

class GameCardParentWidget extends StatefulWidget {
  GameCardParentWidget({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GameCardParent();
  }
}

class GameCardParent extends State<GameCardParentWidget> {
  GameCardParent();

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PADDING_REGULAR_10),
        ),
        elevation: 5,
        margin: EdgeInsets.all(PADDING_REGULAR_15),
        color: Colors.white,
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/gamecard_background.jpg"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            child: Column(children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 70.0,right: 70.0,bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: new Container(
                        child: new Padding(
                            padding: const EdgeInsets.all(PADDING_REGULAR_10),
                            child: new Text(
                              DISPLAY_MENU_2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: COLOR_WHITE,
                                fontSize: FONT_SIZE_HEADING_30,
                              ),
                            )),
                      ),
                    ),
                    new Align(
                      alignment: Alignment.center,
                      child: new Container(
                        child: new Text(
                          DISPLAY_MENU_2_DESCRIPTION,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: COLOR_APPBAR,
                            fontSize: FONT_SIZE_REGULAR_15,
                          ),
                        ),
                      ),
                    ),
                    new GameCardWidget(),
                    new SizedBox(
                      width: double.infinity,
                      child: new RaisedButton(
                        onPressed: searchForPossibleWords,
                        textColor: Colors.white,
                        color: COLOR_APPBAR,
                        padding: const EdgeInsets.all(PADDING_REGULAR_10),
                        child: new Text(
                          BTN_CREATE_TEXT,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }

  void searchForPossibleWords() {
  }
}
