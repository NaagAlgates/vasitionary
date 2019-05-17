import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';

class SearchHomeScreen extends StatefulWidget {
  SearchHomeScreen();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      decoration: BoxDecoration(color: Colors.transparent),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    child: Card(
                      elevation: 30.0,
                      child: TextFormField(
                        style:
                        TextStyle(fontSize: 20.0, color: APP_COLOR_GREEN),
                        maxLines: 1,
                        autofocus: false,
                        autocorrect: false,
                        cursorColor: Colors.black,
                        maxLength: 30,
                        enabled: true,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: APP_COLOR_GREEN)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: APP_COLOR_GREEN)),
                          errorBorder: 0 > 1
                              ? OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.redAccent))
                              : OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          errorText: 0 > 1 ? "No Meaning found" : null,
                          enabled: true,
                          hintText: HINT_SEARCH_TEXT,
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search),
                          counterText: "",
                          suffixIcon: 1 > 0 ? null : Icon(Icons.clear),
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
        SizedBox(height: MediaQuery.of(context).size.height*0.07,),
        Text("Text1"),
      ]),
    );
  }
}
