import 'package:flutter/material.dart';
import 'package:vasitionary/main.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:vasitionary/model/dictionary_word_list.dart';

class HomePage extends State<MyHomePage> {
  final TextEditingController _textController = new TextEditingController();
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<WordList>> key = new GlobalKey();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(APPLICATION_NAME),
        backgroundColor: COLOR_APPBAR,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          decoration: new BoxDecoration(color: COLOR_APPBAR),
          child: new Column(
            children: <Widget>[
              new Card(
                  child: new Padding(
                      padding: const EdgeInsets.all(PADDING_REGULAR_15),
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: searchTextField =
                                AutoCompleteTextField<WordList>(
                              key: key,
                              textInputAction: TextInputAction.search,
                              style: new TextStyle(
                                  fontSize: FONT_SIZE_REGULAR_20,
                                  color: COLOR_BLACK,
                                  decorationColor: COLOR_APPBAR),
                              decoration: new InputDecoration(
                                  contentPadding:
                                      EdgeInsets.all(PADDING_REGULAR_10),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.search,
                                      color: COLOR_APPBAR,
                                    ), // icon is 48px widget.
                                  )),

                              itemBuilder: (context, item) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      item.word,
                                      style: TextStyle(
                                          fontSize: FONT_SIZE_REGULAR_20,
                                          color: COLOR_BLACK,
                                          decorationColor: COLOR_APPBAR),
                                    ),
                                  ],
                                );
                              },
                              itemFilter: (item, query) {
                                return item.word
                                    .toLowerCase()
                                    .startsWith(query.toLowerCase());
                              },
                              itemSorter: (a, b) {
                                return a.word.compareTo(b.word);
                              },
                              itemSubmitted: (item) {
                                setState(() => searchTextField
                                    .textField.controller.text = item.word);
                              },
                              suggestions: DictionaryWordList.wordList,

                              /*TextFormField(
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
                                  decorationColor: COLOR_APPBAR),
                              validator: (val) => val.length < 0
                                  ? DISPLAY_MESSAGE_NO_WORDS
                                  : null,
                              decoration: new InputDecoration(
                                  contentPadding:
                                  EdgeInsets.all(PADDING_REGULAR_10),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.search,
                                      color: COLOR_APPBAR,
                                    ), // icon is 48px widget.
                                  ),
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(0.0),
                                    ),
                                    borderSide: new BorderSide(
                                      color: COLOR_APPBAR,
                                      width: 0.0,
                                    ),
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: IconButton(
                                      icon: IconButton(
                                        icon: Icon(Icons.clear),
                                        disabledColor: COLOR_DISABLED,
                                        highlightColor: COLOR_ENABLED,
                                        onPressed: () {
                                          _textController.clear();
                                        },
                                      ),
                                      onPressed: () {
                                        _textController.clear();
                                      },
                                    ), // icon is 48px widget.
                                  ),
                                  hintText: HINT_SEARCH_TEXT,
                                  hintStyle: TextStyle(
                                      fontSize: FONT_SIZE_REGULAR_20)),
                            ),*/
                            ),
                          )
                        ],
                      ))), //Search text
              new Card(
                  color: Colors.white,
                  child: new Padding(
                    padding: const EdgeInsets.all(PADDING_REGULAR_15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                            padding: const EdgeInsets.all(PADDING_REGULAR_10),
                            child: new Text(
                              DISPLAY_2ND_COLUMN_HEADING,
                              style: TextStyle(
                                color: COLOR_APPBAR,
                                fontSize: FONT_SIZE_HEADING_30,
                              ),
                            )),
                        new Padding(
                            padding: const EdgeInsets.all(PADDING_REGULAR_10),
                            child: new Center(
                                child: new Text(
                              "ஆச்சரியம்",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: COLOR_BLACK,
                                fontSize: FONT_SIZE_REGULAR_20,
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
                              "Causing surprise; unexpected. \"A surprising sequence of events\"",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: COLOR_BLACK,
                                fontSize: FONT_SIZE_REGULAR_20,
                                fontStyle: FontStyle.normal,
                              ),
                            ))),
                      ],
                    ),
                  )),
              new Card(
                  child: new Padding(
                padding: const EdgeInsets.all(PADDING_REGULAR_15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.all(PADDING_REGULAR_10),
                        child: new Text(
                          DISPLAY_3RD_COLUMN,
                          style: TextStyle(
                            color: COLOR_APPBAR,
                            fontSize: FONT_SIZE_HEADING_30,
                          ),
                        )),
                    new Padding(
                        padding: const EdgeInsets.all(PADDING_REGULAR_10),
                        child: new Center(
                            child: new Text(
                          "அகர முதல எழுத்தெல்லாம் ஆதி \nபகவன் முதற்றே உலகு",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: COLOR_BLACK,
                            fontSize: FONT_SIZE_REGULAR_20,
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
                          "A is the first of the alphabet; God is the primary force of the world.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: COLOR_BLACK,
                            fontSize: FONT_SIZE_REGULAR_20,
                            fontStyle: FontStyle.normal,
                          ),
                        ))),
                  ],
                ),
              )),
              new InkWell(
                  onTap: () {
                    print("Playstore tapped");
                  },
                  child: new Card(
                      child: new Padding(
                          padding: const EdgeInsets.all(PADDING_REGULAR_15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(
                                Icons.rate_review,
                                color: COLOR_APPBAR,
                              ),
                              new Padding(
                                  padding:
                                      const EdgeInsets.all(PADDING_REGULAR_15),
                                  child: Text(
                                    "Rate this App on store",
                                    style: TextStyle(
                                        fontSize: FONT_SIZE_REGULAR_15),
                                  )),
                            ],
                          )))),
              new InkWell(
                  onTap: () {
                    print("Share tapped");
                  },
                  child: new Card(
                      child: new Padding(
                          padding: const EdgeInsets.all(PADDING_REGULAR_15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                color: COLOR_APPBAR,
                              ),
                              new Padding(
                                  padding:
                                      const EdgeInsets.all(PADDING_REGULAR_15),
                                  child: Text(
                                      "Share this app with your friends",
                                      style: TextStyle(
                                          fontSize: FONT_SIZE_REGULAR_15))),
                            ],
                          )))),
            ],
          ),
        ),
      ),
    );
  }
}

void _loadData() async {
  await DictionaryWordList.loadPlayers();
}
