import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vasitionary/main.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:vasitionary/model/dictionary_word_list.dart';
import 'package:vasitionary/model/preferences.dart';
import 'package:vasitionary/view/custom_textfield_widget.dart';
import 'package:vasitionary/view/game_card.dart';
import 'package:vasitionary/view/game_card_parent_widget.dart';
import 'package:vasitionary/view/homepage_card_widget.dart';
import 'package:vasitionary/view/navigation_animation.dart';
import 'package:vasitionary/view/view_word_meaning.dart';
import 'package:share/share.dart';
import 'dart:math';

bool isDataLoading = false;

class HomePage extends State<MyHomePage> {
  String selectedWord = "Testing";
  String selectedWordMeaning = "This is testing meaning";
  final TextEditingController _textController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    isDataLoading = true;
    _loadData();
    _clearTextData();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/images/app_background.jpg"),
              fit: BoxFit.cover)),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          title: new Text(APPLICATION_NAME),
          backgroundColor: COLOR_APPBAR,
        ),
        body: _buildBody(),
      ),
    );
  }

  void _clearTextData() {
    _textController.clear();
  }

  void _dataLoaded() {
    setState(() {
      isDataLoading = false;
    });
  }

  void _loadData() async {
    await DictionaryWordList.loadPlayers();
    _loadWordAndMeaning(DictionaryWordList.getCount());
    _dataLoaded();
    //getWordIndex();
  }

  getWordIndex() async {
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt(PREF_WORD_INDEX) ?? 0);
    print('Pressed $counter times.');*/
    int counter = getWordOfTheDayIndex() as int;
    print('$counter times');
  }
}

int _loadWordAndMeaning(int totalWordCount) {
  print(totalWordCount);
  if (totalWordCount > 0) {
    Random rnd;
    int min = 1;
    int max = totalWordCount;
    rnd = new Random();
    int next = min + rnd.nextInt(max - min);
    print("$next is in the range of $min and $max");
    return next;
    //saveWordOfTheDayIndex(next);
  }
}

Widget _buildBody() {
  if (isDataLoading) {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  } else {
    int index = _loadWordAndMeaning(DictionaryWordList.getCount());
    GlobalKey<AutoCompleteTextFieldState<WordList>> key = new GlobalKey();
    AutoCompleteTextField searchTextField;
    return new Container(
      decoration: new BoxDecoration(
        color: COLOR_APPBAR,
        image: new DecorationImage(
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.multiply),
          image: new AssetImage("assets/images/app_background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            clearOnSubmit: true,
                            itemSubmitted: (item) {},
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
                                ),
                                hintText: HINT_SEARCH_TEXT,
                                hintStyle:
                                    TextStyle(fontSize: FONT_SIZE_REGULAR_20)),
                            itemBuilder: (context, item) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(PADDING_REGULAR_10),
                                    child: new InkWell(
                                      child: Text(
                                        item.word,
                                        style: TextStyle(
                                            fontSize: FONT_SIZE_REGULAR_20,
                                            color: COLOR_APPBAR,
                                            decorationColor: COLOR_APPBAR),
                                      ),
                                      onTap: () {
                                        print("Selected");
                                        _sendDataToMeaningScreen(
                                            context,
                                            item.word,
                                            item.meaning,
                                            item.audio,
                                            item.video);
                                      },
                                    ),
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
                            /*itemSubmitted: (item) {
                                setState(() => searchTextField
                                    .textField.controller.text = item.word);
                              },*/
                            suggestions: DictionaryWordList.wordList,
                          ),
                        )
                      ],
                    ))), //Search text
            new GameCardParentWidget(),
            new HomePageCardView(
              word: DictionaryWordList.getWordByIndex(index),
              wordMeaning: DictionaryWordList.getMeaningByIndex(index),
              cardTitle: DISPLAY_2ND_COLUMN_HEADING,
            ),
            new HomePageCardView(
              word: DictionaryWordList.getWordByIndex(133),
              wordMeaning: DictionaryWordList.getMeaningByIndex(133),
              cardTitle: DISPLAY_3RD_COLUMN,
            ),
            new InkWell(
                onTap: () {
                  print("Playstore tapped");
                  Share.share(
                      'check out my website https://iamnagaraj.com');
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
                                padding: const EdgeInsets.all(
                                    PADDING_REGULAR_15),
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
                  Share.share(
                      'check out my website https://iamnagaraj.com');
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
                                padding: const EdgeInsets.all(
                                    PADDING_REGULAR_15),
                                child: Text(
                                    "Share this app with your friends",
                                    style: TextStyle(
                                        fontSize: FONT_SIZE_REGULAR_15))),
                          ],
                        )))),
          ],
        ),
      ),
    );
  }
}

void _sendDataToMeaningScreen(BuildContext context, String selectedWord,
    String wordMeaning, String wordAudio, String wordVideo) {
  Navigator.push(
    context,
    new MyCustomRoute(
      builder: (context) => ViewMeaning(
            video: wordVideo,
            audio: wordAudio,
            meaning: wordMeaning,
            word: wordMeaning,
          ),
    ),
  );
}
