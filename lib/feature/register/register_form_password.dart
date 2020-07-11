import 'package:flutter/material.dart';
import 'package:mp_app/bloc/register_bloc.dart';
import 'package:mp_app/di/event/register_event.dart';
import 'package:mp_app/di/state/register_state.dart';

class RegisterFormPassword extends StatefulWidget {

  RegisterFormPassword({Key key, this.registerBloc}) : super(key: key);

  final RegisterBloc registerBloc;

  State<RegisterFormPassword> createState() => _RegisterFormPasswordState();
}

class _RegisterFormPasswordState extends State<RegisterFormPassword> {
  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated => _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return true;
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  autocorrect: false,
                  autovalidate: true,
                  validator: (_) {
                    return !widget.registerBloc.state.isPasswordValid ? 'Invalid Password' : null;
                  },
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: isRegisterButtonEnabled(widget.registerBloc.state)
                      ? _onFormSubmitted
                      : null,
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onPasswordChanged() {
    widget.registerBloc.add(
      RegisterPasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    String email = widget.registerBloc.state.email;
    widget.registerBloc.add(
      RegisterSubmitted(
        email: email,
        password: _passwordController.text,
      ),
    );
  }
}
