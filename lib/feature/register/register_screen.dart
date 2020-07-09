import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/bloc/register_bloc.dart';
import 'package:mp_app/feature/register/register_form.dart';

class RegisterScreen extends StatelessWidget {

  RegisterScreen({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
