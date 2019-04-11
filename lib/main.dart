import 'package:flutter/material.dart';
import 'helper/constants.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final TextEditingController _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        textSelectionColor: COLOR_APPBAR,
        backgroundColor:COLOR_WHITE,
        cursorColor: COLOR_APPBAR
      ),
      title: TITLE_MAIN_PAGE,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(APPLICATION_NAME),
          backgroundColor: COLOR_APPBAR,
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      autofocus: false,
                      autocorrect: false,
                      autovalidate: false,
                      obscureText: false,
                      textDirection: TextDirection.ltr,
                      textInputAction: TextInputAction.search,
                      maxLength: 20,
                      maxLines: 1,
                      controller: _textController,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: FONT_SIZE_REGULAR_20,
                        color: COLOR_BLACK,
                        decorationColor: COLOR_APPBAR
                      ),
                      validator: (val) => val.length < 0 ? DISPLAY_MESSAGE_NO_WORDS : null,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(PADDING_REGULAR_10),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.search,
                              color: COLOR_APPBAR,
                            ), // icon is 48px widget.
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: IconButton(
                              icon: IconButton(
                                  icon: Icon(Icons.clear),
                                  disabledColor: COLOR_DISABLED,
                                  highlightColor: COLOR_ENABLED, onPressed: () {_textController.clear();},
                                  ),
                              onPressed: () {_textController.clear();},
                            ), // icon is 48px widget.
                          ),
                          hintText: HINT_SEARCH_TEXT,
                          hintStyle: TextStyle(fontSize: FONT_SIZE_REGULAR_20)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
