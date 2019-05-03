import 'package:flutter/material.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final emailFocus = FocusNode();
    final passwordFocus = FocusNode();
    final emailField = Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: PADDING_REGULAR_10,
              bottom: PADDING_REGULAR_10),
          child: TextFormField(
            autofocus: false,
            focusNode: emailFocus,
            enabled: true,
            maxLines: 1,
            maxLength: 30,
            textInputAction: TextInputAction.next,
            style: style,
            onFieldSubmitted: (v) {
              //_fieldFocusChange(context,emailFocus,passwordFocus);
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightGreen,
                    width: 2.0,
                  ),
                ),
                enabled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
                ),
                filled: true,
                fillColor: Colors.transparent,
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.lightGreen,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email",
                counterText: "",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ));
    final passwordField = Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: PADDING_REGULAR_10,
              bottom: PADDING_REGULAR_10),
          child: TextFormField(
            autofocus: false,
            focusNode: passwordFocus,
            onFieldSubmitted: (v) {
              //_fieldFocusChange(context,emailFocus,passwordFocus);
            },
            maxLines: 1,
            maxLength: 30,
            obscureText: passwordVisible,
            style: style,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
                ),
                enabled: true,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.lightGreen,
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.lightGreen,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    }),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Password",
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
          ),
        ));
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.amberAccent,
      child: MaterialButton(
        height: 50.0,
        minWidth: 250.0,
        splashColor: Colors.yellowAccent,
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
        body: Builder(
      builder: (context) => Stack(fit: StackFit.expand, children: <Widget>[
            Container(
              //height: double.infinity,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                  color: Colors.lightGreen,
                  backgroundBlendMode: BlendMode.modulate),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: <Widget>[


                    Stack(
                      children: <Widget>[
                        Container(
                            height: 300.0,
                            decoration: new BoxDecoration(
                                border: new Border.all(
                                    color: Colors.transparent,
                                    width: 5.0,
                                    style: BorderStyle.solid),
                                borderRadius: new BorderRadius.only(
                                    bottomLeft: Radius.circular(90.0)),
                                image: new DecorationImage(
                                  image: new AssetImage(
                                      'assets/images/app_background.jpg'),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.0),
                                      BlendMode.multiply),
                                )))
                      ],
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Stack(
                        children: <Widget>[
                          Card(
                            elevation: 40.0,
                            margin: EdgeInsets.only(
                                top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 60.0,
                                  ),
                                  emailField,
                                  passwordField,
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            PADDING_REGULAR_10),
                                        child: Text(
                                          "Forgot Password?",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  loginButton,
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                ]),
                          ),
                          FractionalTranslation(
                            translation: Offset(0.0, -0.4),
                            child: Align(
                              child: CircleAvatar(
                                  backgroundColor: COLOR_WHITE,
                                  radius: RADIUS_SMALL_CIRCLE,
                                  child: ClipOval(
                                    child: Image(
                                      image: new AssetImage(
                                          "assets/images/logo.gif"),
                                      fit: BoxFit.scaleDown,
                                    ),
                                  )),
                              alignment: FractionalOffset(0.5, 1.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "or",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                        Widget>[
                      Center(
                        child: Container(
                          child: RaisedButton(
                            elevation: 40.0,
                            color: Colors.white,
                            splashColor: Colors.amberAccent,
                            onPressed: () {
                              //do nothing
                            },
                            shape: CircleBorder(
                              side: BorderSide(style: BorderStyle.none),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(PADDING_REGULAR_20),
                                child: Icon(
                                  FontAwesomeIcons.google,
                                  color: Color(0xffCE107c),
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: RaisedButton(
                            elevation: 40.0,
                            color: Colors.white,
                            splashColor: Colors.amberAccent,
                            onPressed: () {
                              //do nothing
                            },
                            shape: CircleBorder(
                              side: BorderSide(style: BorderStyle.none),
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(PADDING_REGULAR_20),
                                child: Icon(
                                  FontAwesomeIcons.facebookF,
                                  color: Color.fromRGBO(59, 89, 152, 1.0),
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ]),
    ));
  }

  @override
  void initState() {
    passwordVisible = false;
  }
/*  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }*/
}
