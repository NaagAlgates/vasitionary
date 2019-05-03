import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vasitionary/bloc/authentication/auth.dart';
import 'package:vasitionary/bloc/authentication/auth_event.dart';
import 'package:vasitionary/bloc/register/register.dart';
import 'package:vasitionary/bloc/register/register_event.dart';
import 'package:vasitionary/bloc/register/register_state.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/ui/register_button.dart';

class RegisterForm extends StatefulWidget {
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }
  bool passwordVisible = true;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _registerBloc,
      listener: (BuildContext context, RegisterState state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(HINT_REGISTERING),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(HINT_ACCOUNT_CREATION_FAILED),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder(
        bloc: _registerBloc,
        builder: (BuildContext context, RegisterState state) {
          return Form(
            child: ListView(
              children: <Widget>[
                Container(
                    height: 200.0,
                    decoration: new BoxDecoration(
                        border: new Border.all(
                            color: Colors.transparent,
                            width: 5.0,
                            style: BorderStyle.solid),
                        /*borderRadius: new BorderRadius.only(
                            bottomLeft: Radius.circular(90.0)),*/
                        image: new DecorationImage(
                          image:
                              new AssetImage('assets/images/fly_dribble.gif'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.0),
                              BlendMode.multiply),
                        ))),
                Card(
                    elevation: 40.0,
                    margin: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),
                          Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 40.0,
                                    right: 40.0,
                                    top: PADDING_REGULAR_10,
                                    bottom: PADDING_REGULAR_10),
                                child: TextFormField(
                                  controller: _emailController,
                                  autofocus: false,
                                  focusNode: emailFocus,
                                  enabled: true,
                                  maxLines: 1,
                                  maxLength: 30,
                                  autovalidate: true,
                                  autocorrect: false,
                                  validator: (_) {
                                    return !state.isEmailValid
                                        ? HINT_INVALID_EMAIL
                                        : null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  style: style,
                                  onFieldSubmitted: (v) {
                                    //_fieldFocusChange(context,emailFocus,passwordFocus);
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: APP_CREATE_ACCOUNT_ICONS,
                                          width: 2.0,
                                        ),
                                      ),
                                      enabled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: APP_CREATE_ACCOUNT_ICONS,
                                            width: 2.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: APP_CREATE_ACCOUNT_ICONS,
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      hintText: HINT_EMAIL,
                                      counterText: "",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0))),
                                ),
                              )),
                          Material(
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
                                  maxLines: MAX_LINES,
                                  maxLength: MAX_CHAR_COUNT,
                                  obscureText: passwordVisible,
                                  style: style,
                                  textInputAction: TextInputAction.done,
                                  controller: _passwordController,
                                  autovalidate: true,
                                  autocorrect: false,
                                  validator: (_) {
                                    return !state.isPasswordValid
                                        ? HINT_INVALID_PASSWORD
                                        : null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: APP_CREATE_ACCOUNT_ICONS,
                                            width: RADIUS_2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: APP_CREATE_ACCOUNT_ICONS,
                                            width: RADIUS_2),
                                      ),
                                      enabled: true,
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: APP_CREATE_ACCOUNT_ICONS,
                                      ),
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                            passwordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: APP_CREATE_ACCOUNT_ICONS,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              passwordVisible =
                                              !passwordVisible;
                                            });
                                          }),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          PADDING_REGULAR_20, PADDING_REGULAR_15, PADDING_REGULAR_20, PADDING_REGULAR_15),
                                      hintText: HINT_PASSWORD,
                                      counterText: "",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(RADIUS_5),
                                      )),
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 40.0,
                                    right: 40.0,
                                    top: PADDING_REGULAR_10,
                                    bottom: PADDING_REGULAR_10),
                                child: Text(
                                  DISPLAY_PASSWORD_CONDITIONS,
                                  style: TextStyle(
                                    fontSize: FONT_SIZE_REGULAR_12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          RegisterButton(
                            onPressed: isRegisterButtonEnabled(state)
                                ? _onFormSubmitted
                                : null,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ])),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc.dispatch(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _registerBloc.dispatch(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _registerBloc.dispatch(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
