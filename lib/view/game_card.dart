import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/view/custom_textfield_widget.dart';

class GameCardWidget extends StatefulWidget {
  GameCardWidget({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GameCard();
  }
}

class GameCard extends State<GameCardWidget> {
  GameCard();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  backgroundColor: R1C1,
                )),
                new Expanded(
                    child: new TextFieldWidget(
                  backgroundColor: R1C2,
                )),
                new Expanded(
                    child: new TextFieldWidget(
                  backgroundColor: R1C3,
                )),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextFieldWidget(
                      backgroundColor: R2C1,
                    )),
                new Expanded(
                    child: new TextFieldWidget(
                      backgroundColor: R2C2,
                    )),
                new Expanded(
                    child: new TextFieldWidget(
                      backgroundColor: R2C3,
                    )),
              ],
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextFieldWidget(
                      backgroundColor: R3C1,
                    )),
                new Expanded(
                    child: new TextFieldWidget(
                      backgroundColor: R3C2,
                    )),
                new Expanded(
                    child: new TextFieldWidget(
                      backgroundColor: R3C3,
                    )),
              ],
            ),
          ],
        ));
  }
}
