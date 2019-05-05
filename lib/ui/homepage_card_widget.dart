import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';

class HomePageCardView extends StatefulWidget {
  String word;
  String wordMeaning;
  String cardTitle;
  String displayImage;

  // receive data from the FirstScreen as a parameter
  HomePageCardView(
      {Key key,
      @required this.word,
      @required this.wordMeaning,
      @required this.cardTitle,
      @required this.displayImage})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardViewState(word, wordMeaning, cardTitle, displayImage);
  }
}

class CardViewState extends State<HomePageCardView> {
  String word;
  String wordMeaning;
  String cardTitle;
  String displayImage;

  CardViewState(this.word, this.wordMeaning, this.cardTitle, this.displayImage);

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PADDING_REGULAR_10),
        ),
        elevation: ELEVATION_GAME_AREA,
        margin: const EdgeInsets.only(
            top: 60.0,
            left: PADDING_REGULAR_10,
            right: PADDING_REGULAR_10,
            bottom: PADDING_REGULAR_20),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/card_background.jpg"),
              fit: BoxFit.fill,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              alignment: Alignment.topCenter,
            ),
          ),
          child: new Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 10.0, right: 10.0, bottom: 10.0),
              child:
                  new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                new Align(
                  alignment: Alignment.centerLeft,
                  child: new Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: new Padding(
                        padding: const EdgeInsets.only(
                            left: 0.0, top: 50.0, right: 0.0, bottom: 0.0),
                        child: new Text(
                          cardTitle,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: COLOR_BLACK,
                            fontSize: FONT_SIZE_REGULAR_20,
                          ),
                        )),
                  ),
                ),
                new Padding(
                    padding: const EdgeInsets.all(PADDING_REGULAR_10),
                    child: new Center(
                        child: new Text(
                      word,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: COLOR_APPBAR,
                        fontSize: FONT_SIZE_HEADING_30,
                        fontStyle: FontStyle.normal,
                      ),
                    ))),
                new Align(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      HINT_MEANING_TEXT,
                      style: TextStyle(
                          color: COLOR_BLACK,
                          fontSize: FONT_SIZE_REGULAR_15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    )),
                new Padding(
                    padding: const EdgeInsets.all(PADDING_REGULAR_10),
                    child: new Center(
                        child: new Text(
                      wordMeaning,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: COLOR_BLACK,
                        fontSize: FONT_SIZE_REGULAR_20,
                        fontStyle: FontStyle.normal,
                      ),
                    ))),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: new Image(
                          image: new AssetImage("assets/images/icon_audio.png"),
                          width: 25.0,
                          height: 25.0,
                        ),
                      ),
                      new Image(
                        image: new AssetImage("assets/images/icon_video.png"),
                        width: 25.0,
                        height: 25.0,
                      ),
                    ],
                  ),
                ),
              ])),
        ),
      ),
      FractionalTranslation(
        translation: Offset(0.0, 0.3),
        child: Align(
          child: CircleAvatar(
            backgroundColor: COLOR_WHITE,
            radius: RADIUS_SMALL_CIRCLE,
            child: new Image(
              image: new AssetImage(displayImage),
            ),
          ),
          alignment: FractionalOffset(0.5, 1.0),
        ),
      ),
    ]);
  }
}
