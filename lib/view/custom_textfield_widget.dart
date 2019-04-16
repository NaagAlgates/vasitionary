import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';

class TextFieldWidget extends StatefulWidget {
  Color backgroundColor;
  TextEditingController controller;
  bool isEnabled;
  String initialValue;
  TextFieldWidget({Key key, @required this.backgroundColor,
    @required this.controller,
    @required this.isEnabled,
    @required this.initialValue
  }) :
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldCard(backgroundColor,controller,isEnabled,initialValue);
  }
}

class TextFieldCard extends State<TextFieldWidget> {
  Color backgroundColor;
  TextEditingController controller;
  bool isEnabled;
  String initialValue;
  TextFieldCard(this.backgroundColor,this.controller,this.isEnabled,this.initialValue);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: new Padding(
        padding: EdgeInsets.all(PADDING_REGULAR_10),
        child: new Align(
          alignment: Alignment.center,
          child: new TextFormField(
            initialValue: initialValue,
            enabled: isEnabled,
            controller: controller,
              textAlign: TextAlign.center,
              maxLines: 1,
              maxLength: 1,
              textDirection: TextDirection.ltr,
              autocorrect: false,
              autofocus: false,
              style: TextStyle(
                color: COLOR_WHITE,
                fontSize: FONT_SIZE_HEADING_30,
              ),
              cursorColor: Colors.transparent,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ))),
        ),
      ),
    );
  }
}
