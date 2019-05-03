import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.amberAccent,
      child: MaterialButton(
        disabledColor: Colors.black54,
        onPressed: _onPressed,
        height: 50.0,
        minWidth: 250.0,
        splashColor: Colors.yellowAccent,
        child: Text(HINT_LOGIN,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black,fontSize: 18.0, fontWeight: FontWeight.bold)),
      ),
    );
    return loginButton;/*RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: _onPressed,
      child: Text('Login'),
    );*/
  }
}