import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatefulWidget  {

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  bool isLogged = false;

  Future<FirebaseUser> _loginWithFacebook() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logIn(['email']);

    debugPrint(result.status.toString());
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLogged
        ? MaterialButton(
          color: Colors.blue,
          child: Text('LOGIN'),
        ) :FacebookSignInButton(onPressed:_loginWithFacebook)
    );
  }
}