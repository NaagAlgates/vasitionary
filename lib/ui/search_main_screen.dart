import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';

class SearchHomeScreen extends StatefulWidget {
  SearchHomeScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchHomeScreen> {
  _SearchPageState();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    return new Card(
      child: new Form(
        key: _formKey,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            /*new TextFormField(
              decoration: InputDecoration(labelText: "Enter App ID")
            ),*/
          ],
        ),
      ),
    );
  }
}
