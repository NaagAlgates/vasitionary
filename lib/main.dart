import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vasitionary/ui/homescreen.dart';
import 'package:vasitionary/ui/login/login_screen.dart';
import 'package:vasitionary/ui/splashscreen.dart';
import 'bloc/authentication/auth.dart';
import 'bloc/authentication/auth_delegate.dart';
import 'bloc/authentication/auth_event.dart';
import 'bloc/authentication/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/user_repository.dart';

void main() {
  // Full screen UI
  //SystemChrome.setEnabledSystemUIOverlays([]);
  BlocSupervisor().delegate = AuthBlocDelegate();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _authenticationBloc,
      child: MaterialApp(
        color: Colors.lightGreen,
        home: BlocBuilder(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Authenticated) {
              return HomeScreen(userEmail: state.displayName,userDpUrl: state.displayImage, userName: state.displayUserName,);
            }
            if (state is Unauthenticated) {
              return LoginScreen(userRepository: _userRepository);
            }
          },
        ),
      ),
    );
  }

}