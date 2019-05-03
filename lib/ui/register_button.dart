import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: _onPressed,
      child: Text('Register'),
    );*/
      Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.lightGreen,
        child: MaterialButton(
          disabledColor: Colors.grey,
          onPressed: _onPressed,
          height: 50.0,
          minWidth: 250.0,
          splashColor: Colors.yellowAccent,
          child: Text(BTN_CREATE_TEXT,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,fontSize: 18.0, fontWeight: FontWeight.bold)),
        ),
      );
  }
}