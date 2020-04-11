import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget  {

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;

  Future<FirebaseUser> _loginWithFacebook() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logIn(['email']);

    debugPrint(result.status.toString());

    if (result.status == FacebookLoginStatus.loggedIn) {
      final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token
      );

      final FirebaseUser user =
      (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return user;
    }

    return null;
  }

  Future<FirebaseUser> _loginWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email']
    );

    final GoogleSignInAccount account = await _googleSignIn.signIn();
    if(account.id != null){
      final GoogleSignInAuthentication authentication = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return user;
    } else{
      return null;
    }
  }

  void _logInFacebook(){
    _loginWithFacebook().then((value) => print(value))
        .catchError((onError) => print(onError));
  }

  void _logInGoogle(){
    _loginWithGoogle().then((value) => print(value))
        .catchError((onError) => print(onError));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLogged
        ? MaterialButton(
          color: Colors.blue,
          child: Text('LOGIN'),
        ) : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FacebookSignInButton(onPressed:_logInFacebook),
          GoogleSignInButton(onPressed: _logInGoogle)
        ],
      )
    );
  }
}