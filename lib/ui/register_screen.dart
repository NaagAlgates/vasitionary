import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vasitionary/bloc/register/register.dart';
import 'package:vasitionary/helper/constants.dart';
import 'package:vasitionary/model/user_repository.dart';
import 'package:vasitionary/ui/register_form.dart';

class RegisterScreen extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(
      userRepository: widget._userRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          TITLE_CREATE_ACCOUNT,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: HexColor("#82E3FF"),
        elevation: 0.0,
      ),
      backgroundColor: HexColor("#82E3FF"),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          bloc: _registerBloc,
          child: RegisterForm(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _registerBloc.dispose();
    super.dispose();
  }
}
