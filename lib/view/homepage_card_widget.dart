import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';

class HomePageCardView extends StatefulWidget {
  String word;
  String wordMeaning;
  String cardTitle;

  // receive data from the FirstScreen as a parameter
  HomePageCardView(
      {Key key,
      @required this.word,
      @required this.wordMeaning,
      @required this.cardTitle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardViewState(word, wordMeaning, cardTitle);
  }
}

class CardViewState extends State<HomePageCardView> {
  String word;
  String wordMeaning;
  String cardTitle;

  CardViewState(this.word, this.wordMeaning, this.cardTitle);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              image: AssetImage("assets/images/card_background.jpg"),
              fit: BoxFit.fill,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              alignment: Alignment.topCenter,
            ),
          ),
          child: new Padding(
              padding: const EdgeInsets.all(PADDING_REGULAR_15),
              child:
                  new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                new Align(
                  alignment: Alignment.centerLeft,
                  child: new Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: new Padding(
                        padding: const EdgeInsets.only(
                            left: 0.0, top: 25.0, right: 0.0, bottom: 0.0),
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
                      "Meaning: ",
                      style: TextStyle(
                        color: COLOR_BLACK,
                        fontSize: FONT_SIZE_REGULAR_15,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold
                      ),
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
                            image:
                                new AssetImage("assets/images/icon_audio.png"),
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
        ));
  }
}
