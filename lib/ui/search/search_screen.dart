import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vasitionary/bloc/search/bloc.dart';
import 'package:vasitionary/bloc/search/event.dart';
import 'package:vasitionary/bloc/search/state.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/model/dictionary_word_list.dart';

class SearchHomeScreen extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchHomeScreen> {
  final SearchBloc _searchBloc = SearchBloc();
  TextEditingController _wordController; //= TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<WordList>> _formKey = new GlobalKey();
  _SearchPageState();
  @override
  void initState() {
    super.initState();
    _wordController = TextEditingController();
    _wordController.addListener(onTextChanged);
    _loadData();
  }

  void _loadData() async {
    await DictionaryWordList.loadPlayers();
  }

  void onTextChanged() {
    _searchBloc.dispatch(TextChanged(text: _wordController.text));
  }

  void onWordSelected(String word) {
    _searchBloc.dispatch(Selected(text: word));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _searchBloc,
        builder: (BuildContext context, SearchState state) {
          /*if (state.isSuccess) {
          return Container(); */ /*SuccessDialog(onDismissed: () {
          _emailController.clear();
          _passwordController.clear();
          _myFormBloc.dispatch(FormReset());
          _searchBloc.dispatch(FormReset());*/ /*
        }
      }*/
          print("SUCCESS");
          print(state.isSuccess);
          print("SUBMIT");
          print(state.isSubmitting);
          if (!state.isDataLoaded) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: ListView(children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      fit: StackFit.loose,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .05,
                              decoration: BoxDecoration(color: APP_COLOR_GREEN),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .05,
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Container(
                            child: Card(
                              elevation: 30.0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, top: 10.0),
                                child: AutoCompleteTextField<WordList>(
                                  key: _formKey,
                                  controller: _wordController,
                                  clearOnSubmit: false,
                                  itemSubmitted: (item) {
                                    //onWordSelected(_wordController.text);
                                  },
                                  textInputAction: TextInputAction.done,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              SIZE_20,
                                      color: COLOR_BLACK,
                                      decorationColor: COLOR_APPBAR),
                                  decoration: new InputDecoration(
                                      contentPadding:
                                          EdgeInsets.all(PADDING_REGULAR_10),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.search,
                                          color: APP_COLOR_GREEN,
                                        ), // icon is 48px widget.
                                      ),
                                      hintText: HINT_SEARCH_TEXT,
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              SIZE_20)),
                                  itemBuilder: (context, item) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(
                                              PADDING_REGULAR_10),
                                          child: new InkWell(
                                            child: Text(
                                              item.word,
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          SIZE_20,
                                                  color: COLOR_APPBAR,
                                                  decorationColor:
                                                      COLOR_APPBAR),
                                            ),
                                            onTap: () {
                                                String temp = item.word;
                                                print("Selected Word: $temp");
                                                onWordSelected(temp);
                                                print(state.isSuccess);
                                                _wordController.text = "";
                                              /*String temp = item.word;
                                              print("Selected Word: $temp");
                                              onWordSelected(temp);
                                              print(state.isSuccess);
                                              _wordController.text = "";*/
                                              //if(state.isSuccess)
                                              /*_sendDataToMeaningScreen(
                                      context,
                                      item.word,
                                      item.meaning,
                                      item.audio,
                                      item.video)*/;
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
                              /*TextFormField(
                              style: TextStyle(
                                  fontSize: 20.0, color: APP_COLOR_GREEN),
                              maxLines: 1,
                              controller: _wordController,
                              validator: (_){
                                return !state.isWordEntered
                                    ? "Type more than 3 letters"
                                    : null;
                              },
                              autofocus: false,
                              autocorrect: false,
                              cursorColor: Colors.black,
                              maxLength: 30,
                              enabled: true,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: APP_COLOR_GREEN)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: APP_COLOR_GREEN)),
                                errorBorder: 0 > 1
                                    ? OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.redAccent))
                                    : OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                errorText: 0 > 1 ? "No Meaning found" : null,
                                enabled: true,
                                hintText: HINT_SEARCH_TEXT,
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: APP_COLOR_GREEN,
                                ),
                                // ,
                                counterText: "",
                                suffixIcon: !state.isWordEntered
                                    ? null
                                    : Icon(
                                        Icons.clear,
                                        color: APP_COLOR_GREEN,
                                      ),
                                // ,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                ),
                                contentPadding:
                                    EdgeInsets.only(top: 20.0, bottom: 10.0),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),*/
                            ),
                            decoration: new BoxDecoration(boxShadow: [
                              new BoxShadow(
                                color: APP_COLOR_GREEN,
                                blurRadius: 30.0,
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text("Text1"),
              ]),
            );
          }
        });
  }
}
