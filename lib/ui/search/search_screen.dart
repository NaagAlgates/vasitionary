import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vasitionary/bloc/search/bloc.dart';
import 'package:vasitionary/bloc/search/event.dart';
import 'package:vasitionary/bloc/search/state.dart';
import 'package:vasitionary/helper/constants.dart';

class SearchHomeScreen extends StatefulWidget {
  SearchHomeScreen();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchHomeScreen> {
  final SearchBloc _searchBloc = SearchBloc();
  final TextEditingController _wordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _wordController.addListener(onTextChanged);
  }

  void onTextChanged() {
    _searchBloc.dispatch(TextChanged(text: _wordController.text));
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
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          child: Card(
                            elevation: 30.0,
                            child: TextFormField(
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
                            ),
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
        });
  }
}
