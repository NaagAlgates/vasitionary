import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vasitionary/bloc/login/login.dart';
import 'package:vasitionary/bloc/login/login_event.dart';
import 'package:vasitionary/helper/constants.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(FontAwesomeIcons.google, color: Colors.white),
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).dispatch(
          LoginWithGooglePressed(),
        );
      },
      label: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
    );*/
      RaisedButton(
        elevation: 40.0,
        color: Colors.white,
        splashColor: Colors.amberAccent,
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).dispatch(
              LoginWithGooglePressed(),);
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(style: BorderStyle.solid,color: Colors.lightGreen),borderRadius: BorderRadius.all(Radius.circular(40.0))
        ),
        child: Center(
          child: Padding(
            padding:
            const EdgeInsets.all(PADDING_REGULAR_20),
            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.google,
                  color: Color(0xffCE107c),
                  size: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(HINT_LOGIN_GOOGLE,style: TextStyle(fontSize: 14.0),)
              ],
            ),
          ),
        ),
      );
  }
}