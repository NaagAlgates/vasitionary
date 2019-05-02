import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/ui/custom_textfield_widget.dart';
import 'package:vasitionary/ui/game_card.dart';
import 'package:vasitionary/ui/game_word_list.dart';
import 'package:vasitionary/ui/navigation_animation.dart';

String sR1C1, sR1C2, sR1C3, sR2C1, sR2C2, sR2C3, sR3C1, sR3C2, sR3C3;
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
  void initState() {
    super.initState();
    tR1C1.text = "";
    tR1C2.text = "";
    tR1C3.text = "";

    tR2C1.text = "";
    tR2C2.text = "";
    tR2C3.text = "";

    tR3C1.text = "";
    tR3C2.text = "";
    tR3C3.text = "";
  }

  @override
  void dispose() {
    tR1C1.dispose();
    tR1C2.dispose();
    tR1C3.dispose();

    tR2C1.dispose();
    tR2C2.dispose();
    tR2C3.dispose();

    tR3C1.dispose();
    tR3C2.dispose();
    tR3C3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Container(
      key: _scaffoldKey,
      margin: const EdgeInsets.only(
          top: 60.0,
          left: PADDING_REGULAR_10,
          right: PADDING_REGULAR_10,
          bottom: PADDING_REGULAR_10),
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.circular(PADDING_REGULAR_10),
        color: Colors.transparent,
        /*image: DecorationImage(
          image: AssetImage("assets/images/gamecard_background.jpg"),
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),*/
      ),
      child: new Stack(
        children: <Widget>[
          new Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(PADDING_REGULAR_10),
            ),
            elevation: PADDING_REGULAR_10,
            margin: EdgeInsets.all(PADDING_REGULAR_10),
            color: COLOR_WHITE,
            child: Container(
              child: new Column(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft:
                                      const Radius.circular(PADDING_REGULAR_10),
                                  topRight: const Radius.circular(
                                      PADDING_REGULAR_10)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: new AssetImage(
                                    "assets/images/semi_background.png"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(PADDING_REGULAR_15),
                            child: new Align(
                              alignment: Alignment.centerRight,
                              child: new InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => new AlertDialog(
                                            title: new Text("Help"),
                                            content: new Text(
                                                "Enter all the letters in the matrix to start the game."),
                                          ));
                                },
                                child: new Image(
                                  image: new AssetImage(
                                      "assets/images/icon_help.png"),
                                  width: ICON_SMALL_WIDTH,
                                  height: ICON_SMALL_HEIGHT,
                                ),
                              ),
                            ),
                          ),
                          new Container(
                            padding: new EdgeInsets.only(top: 64.0),
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.center,
                                  child: new Container(
                                    child: new Text(
                                      DISPLAY_MENU_2,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: COLOR_APPBAR,
                                          fontSize: FONT_SIZE_HEADING_30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                /*new Align(
                                  alignment: Alignment.center,
                                  child: new Container(
                                    child: new Text(
                                      DISPLAY_MENU_2_DESCRIPTION,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: COLOR_BLACK,
                                        fontSize: FONT_SIZE_REGULAR_15,
                                      ),
                                    ),
                                  ),
                                ),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(PADDING_REGULAR_10),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        //new GameCardWidget(),
                        new Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(PADDING_REGULAR_10),
                            ),
                            elevation: ELEVATION_GAME_AREA,
                            margin: EdgeInsets.all(PADDING_REGULAR_15),
                            color: Colors.white,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    new Expanded(
                                        child: new TextFieldWidget(
                                      backgroundColor: R1C1,
                                      controller: tR1C1,
                                      isEnabled: true,
                                      initialValue: null,
                                    )),
                                    new Expanded(
                                        child: new TextFieldWidget(
                                      backgroundColor: R1C2,
                                      controller: tR1C2,
                                      isEnabled: true,
                                      initialValue: null,
                                    )),
                                    new Expanded(
                                        child: new TextFieldWidget(
                                      backgroundColor: R1C3,
                                      controller: tR1C3,
                                      isEnabled: true,
                                      initialValue: null,
                                    )),
                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Expanded(
                                        child: new TextFieldWidget(
                                      backgroundColor: R2C1,
                                      controller: tR2C1,
                                      isEnabled: true,
                                      initialValue: null,
                                    )),
                                    new Expanded(
                                        child: new TextFieldWidget(
                                      backgroundColor: R2C2,
                                      controller: tR2C2,
                                      isEnabled: true,
                                      initialValue: null,
                                    )),
                                    new Expanded(
                                        child: new TextFieldWidget(
                                      backgroundColor: R2C3,
                                      controller: tR2C3,
                                      isEnabled: true,
                                      initialValue: null,
                                    )),
                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Expanded(
                                        child: new TextFieldWidget(
                                      backgroundColor: R3C1,
                                      controller: tR3C1,
                                      isEnabled: true,
                                      initialValue: null,
                                    )),
                                    new Expanded(
                                        child: new TextFieldWidget(
                                      backgroundColor: R3C2,
                                      controller: tR3C2,
                                      isEnabled: true,
                                      initialValue: null,
                                    )),
                                    new Expanded(
                                        child: new TextFieldWidget(
                                      backgroundColor: R3C3,
                                      controller: tR3C3,
                                      isEnabled: true,
                                      initialValue: null,
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
                  ),
                ],
              ),
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.0, -0.4),
            child: Align(
              child: CircleAvatar(
                backgroundColor: COLOR_WHITE,
                radius: RADIUS_CIRCLE,
                child: new Image(
                  image: new AssetImage("assets/images/icon_word_mines.png"),
                ),
              ),
              alignment: FractionalOffset(0.5, 0.0),
            ),
          ),
        ],
      ),
    );
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

    /*Navigator.push(
      context,
      new MyCustomRoute(
        builder: (context) => DisplayWordList(sR1C1: sR1C1,sR1C2:sR1C2,sR1C3:sR1C3,sR2C1:sR2C1,sR2C2:sR2C2,sR2C3:sR2C3,sR3C1:sR3C1,sR3C2:sR3C2,sR3C3:sR3C3
        ),
      ),
    );*/
  }
}
