import 'dart:math';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/model/dictionary_word_list.dart';

import 'homepage_card_widget.dart';

bool isDataLoading = false;
class SearchHomeScreen extends StatefulWidget {
  SearchHomeScreen();

  @override
  _SearchPageState createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchHomeScreen> {

  @override
  void initState() {
    super.initState();
    isDataLoading = true;
    _loadData();
  }

  void _loadData() async {
    await DictionaryWordList.loadPlayers();
    //_loadWordAndMeaning(DictionaryWordList.getCount());
    _dataLoaded();
    //getWordIndex();
  }

  void _dataLoaded() {
    setState(() {
      isDataLoading = false;
    });
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

  @override
  Widget build(BuildContext context) {
    if (isDataLoading) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      int index = _loadWordAndMeaning(DictionaryWordList.getCount());
      GlobalKey<
          AutoCompleteTextFieldState<WordList>> _formKey = new GlobalKey();
      AutoCompleteTextField searchTextField;
      return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: new BoxDecoration(
            color: COLOR_APPBAR,
            image: new DecorationImage(
              image: new AssetImage("assets/images/app_background.jpg"),
              fit: BoxFit.cover,
            )),
        child: ListView(
          children: <Widget>[
            /*new TextFormField(
            decoration: InputDecoration(labelText: "Enter App ID")
          ),*/
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 40.0,
                child: Container(
                  color: Colors.white,
                  height:  MediaQuery.of(context).size.height * .12,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: searchTextField = AutoCompleteTextField<WordList>(
                            key: _formKey,
                            clearOnSubmit: true,
                            itemSubmitted: (item) {},
                            textInputAction: TextInputAction.search,
                            style: new TextStyle(
                                fontSize: MediaQuery.of(context).size.width*SIZE_20,
                                color: COLOR_BLACK,
                                decorationColor: COLOR_APPBAR),
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.all(PADDING_REGULAR_10),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Icon(
                                    Icons.search,
                                    color: COLOR_APPBAR,
                                  ), // icon is 48px widget.
                                ),
                                hintText: HINT_SEARCH_TEXT,
                                hintStyle: TextStyle(fontSize: MediaQuery.of(context).size.width*SIZE_20)),
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
                                            fontSize: MediaQuery.of(context).size.width*SIZE_20,
                                            color: COLOR_APPBAR,
                                            decorationColor: COLOR_APPBAR),
                                      ),
                                      onTap: () {
                                        print("Selected");
                                        /*_sendDataToMeaningScreen(
                                    context,
                                    item.word,
                                    item.meaning,
                                    item.audio,
                                    item.video);*/
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            new HomePageCardView(
              word: DictionaryWordList.getWordByIndex(index),
              wordMeaning: DictionaryWordList.getMeaningByIndex(index),
              cardTitle: DISPLAY_2ND_COLUMN_HEADING, displayImage: "assets/images/icon_tip.png",
            ),
            new HomePageCardView(
              word: DictionaryWordList.getWordByIndex(133),
              wordMeaning: DictionaryWordList.getMeaningByIndex(133),
              cardTitle: DISPLAY_3RD_COLUMN, displayImage: "assets/images/icon_thiruvalluvar.png",
            ),
          ],
        ),
      );
    }
  }
}
