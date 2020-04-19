import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:mp_app/manager/authenticationManager.dart';

class LoginPage extends StatefulWidget  {
  LoginPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  String _errorMessage = "";


  void _logInFacebook(){
    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });
    widget.auth.signWithFacebook().then((String userId) => _logInSuccess(userId))
        .catchError((onError) => _setErro(onError));
  }

  void _logInGoogle(){
    setState(() {
      _isLoading = true;
    });
    widget.auth.signWithGoogle().then((String userId) => _logInSuccess(userId))
        .catchError((onError) => _setErro(onError));
  }

  void _logInSuccess(String userId){
    setState(() {
      _isLoading = false;
    });
    if (userId.length > 0 && userId != null) {
      widget.loginCallback();
    }
  }

  void _setErro(Error onError){
    setState(() {
      _isLoading = false;
      _errorMessage = onError.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(42, 43, 47, 100),
      body: Stack(
        children: <Widget>[
          showForm(),
          showCircularProgress(),
        ],
      ),
    );
  }

  showForm() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),
            showSocialButton(),
          ],
        )
    );
  }

  Widget showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showLogo(){
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 80.0,
          child: Image.asset('images/momplog.png'),
        ),
      ),
    );
  }

  Widget showSocialButton(){
    return Column(
      children: <Widget>[
        FacebookSignInButton(
            text: 'Sign in with Facebook',
            borderRadius: 10.0,
            onPressed:_logInFacebook
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: GoogleSignInButton(
            text: 'Sign in with Google     ',
            onPressed: _logInGoogle,
            borderRadius: 10.0,
            darkMode: true,
          ),
        )
      ],
    );
  }

  //Tool of development
  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}