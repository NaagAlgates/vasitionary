import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';
class HomePageCardView extends StatefulWidget{

String word;
String wordMeaning;
String cardTitle;
  // receive data from the FirstScreen as a parameter
  HomePageCardView({Key key, @required this.word, @required this.wordMeaning, @required this.cardTitle}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardViewState(word,wordMeaning,cardTitle);
  }

}

class CardViewState extends State<HomePageCardView> {
  String word;
  String wordMeaning;
  String cardTitle;
  CardViewState(this.word,this.wordMeaning,this.cardTitle);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        color: Colors.white,
        child: new Padding(
          padding: const EdgeInsets.all(PADDING_REGULAR_15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Align(
                alignment: Alignment.centerLeft,
                child: new Padding(
                    padding: const EdgeInsets.all(PADDING_REGULAR_10),
                    child: new Text(
                      cardTitle,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: COLOR_BLACK,
                        fontSize: FONT_SIZE_REGULAR_15,
                      ),
                    )),
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
            ],
          ),
        ));
  }
}