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

    callbackR1C1(String data) {
      setState(() {
        sR1C1 = tR1C1.text.toString();
      });
    }
    callbackR1C2() {
      setState(() {
        sR1C2 = tR1C2.text.toString();
      });
    }
    callbackR1C3() {
      setState(() {
        sR1C3 = tR1C3.text.toString();
      });
    }
    callbackR2C3() {
      setState(() {
        sR2C3 = tR2C1.text.toString();
      });
    }
    callbackR2C2() {
      setState(() {
        sR2C2 = tR2C2.text.toString();
      });
    }
    callbackR2C1() {
      setState(() {
        sR2C1 = tR2C3.text.toString();
      });
    }
    callbackR3C1() {
      setState(() {
        sR3C1 = tR3C1.text.toString();
      });
    }
    callbackR3C2() {
      setState(() {
        sR3C2 = tR3C2.text.toString();
      });
    }
    callbackR3C3() {
      setState(() {
        sR3C3 = tR3C3.text.toString();
      });
    }
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
        ));
  }
}
