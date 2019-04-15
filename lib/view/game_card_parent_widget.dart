import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/view/custom_textfield_widget.dart';
import 'package:vasitionary/view/game_card.dart';

String sR1C1,sR1C2,sR1C3,sR2C1,sR2C2,sR2C3,sR3C1,sR3C2,sR3C3;
TextEditingController tR1C1 = new TextEditingController();
TextEditingController tR1C2 = new TextEditingController();
TextEditingController tR1C3 = new TextEditingController();

TextEditingController tR2C1 = new TextEditingController();
TextEditingController tR2C2 = new TextEditingController();
TextEditingController tR2C3 = new TextEditingController();

TextEditingController tR3C1 = new TextEditingController();
TextEditingController tR3C2 = new TextEditingController();
TextEditingController tR3C3 = new TextEditingController();
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
        elevation: PADDING_REGULAR_10,
        margin: EdgeInsets.all(PADDING_REGULAR_10),
        color: Colors.white,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(PADDING_REGULAR_10),
              image: DecorationImage(
                image: AssetImage("assets/images/gamecard_background.jpg"),
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            child: Column(children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 70.0,right: 70.0,bottom: PADDING_REGULAR_10),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.center,
                      child: new Container(
                        child: new Padding(
                            padding: const EdgeInsets.all(PADDING_REGULAR_10),
                            child: new Text(
                              DISPLAY_MENU_2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: COLOR_WHITE,
                                fontSize: FONT_SIZE_HEADING_30,
                                fontWeight: FontWeight.bold
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
                            color: Colors.amberAccent,
                            fontSize: FONT_SIZE_REGULAR_15,
                          ),
                        ),
                      ),
                    ),
                    //new GameCardWidget(),
                    new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(PADDING_REGULAR_10),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(PADDING_REGULAR_15),
                        color: Colors.white,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Expanded(
                                    child: new TextFieldWidget(
                                      backgroundColor: R1C1, controller: tR1C1,
                                    )),
                                new Expanded(
                                    child: new TextFieldWidget(
                                      backgroundColor: R1C2, controller: tR1C2,
                                    )),
                                new Expanded(
                                    child: new TextFieldWidget(
                                      backgroundColor: R1C3,controller: tR1C3,
                                    )),
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                new Expanded(
                                    child: new TextFieldWidget(
                                      backgroundColor: R2C1,controller: tR2C1,
                                    )),
                                new Expanded(
                                    child: new TextFieldWidget(
                                      backgroundColor: R2C2,controller: tR2C2,
                                    )),
                                new Expanded(
                                    child: new TextFieldWidget(
                                      backgroundColor: R2C3, controller: tR2C3,
                                    )),
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                new Expanded(
                                    child: new TextFieldWidget(
                                      backgroundColor: R3C1, controller: tR3C1,
                                    )),
                                new Expanded(
                                    child: new TextFieldWidget(
                                      backgroundColor: R3C2, controller: tR3C2,
                                    )),
                                new Expanded(
                                    child: new TextFieldWidget(
                                      backgroundColor: R3C3, controller: tR3C3,
                                    )),
                              ],
                            ),
                          ],
                        )),
                    new RaisedButton(
                      onPressed: searchForPossibleWords,
                      textColor: Colors.white,
                      color: APP_COLOR_GREEN,
                      padding: const EdgeInsets.all(PADDING_REGULAR_10),
                      child: new Text(
                        BTN_CREATE_TEXT,
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }

  void searchForPossibleWords() {
    sR1C1 = tR1C1.text;
    print(sR1C1);
    sR1C2 = tR1C2.text;
    print(sR1C2);
    sR1C3 = tR1C3.text;
    print(sR1C3);

    sR2C1 = tR2C1.text;
    print(sR2C1);
    sR2C2 = tR2C2.text;
    print(sR2C2);
    sR2C3 = tR2C3.text;
    print(sR2C3);

    sR3C1 = tR3C1.text;
    print(sR3C1);
    sR3C2 = tR3C2.text;
    print(sR3C2);
    sR3C3 = tR3C3.text;
    print(sR3C3);
  }
}
