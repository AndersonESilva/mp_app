import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/bloc/register_bloc.dart';
import 'package:mp_app/di/event/register_event.dart';
import 'package:mp_app/di/state/register_state.dart';

class RegisterFormEmail extends StatefulWidget {
  State<RegisterFormEmail> createState() => _RegisterFormEmailState();
}

class _RegisterFormEmailState extends State<RegisterFormEmail> {
  final TextEditingController _emailController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated => _emailController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              autovalidate: true,
              validator: (_) {
                return !_registerBloc.state.isEmailValid ? 'Invalid Email' : null;
              },
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: (){
                _registerBloc.add(RegisterEmailSearch());
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc.add(
      RegisterEmailChanged(email: _emailController.text),
    );
  }

  void _onFormSubmitted() {
    _registerBloc.add(
      RegisterSubmitted(
        email: _emailController.text
      ),
    );
  }
}
