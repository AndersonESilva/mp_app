import 'package:flutter/material.dart';
import 'package:mp_app/feature/home/homePage.dart';
import 'package:mp_app/feature/login/loginPage.dart';

import 'feature/splash/splashPage.dart';
import 'manager/authenticationManager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLUTTER",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(
        auth: Auth(),
      )
    );
  }
}

class MainPage extends StatefulWidget {
  final BaseAuth auth;

  MainPage({this.auth});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
        user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.LOGGED_IN:
        if(_userId.length > 0 && _userId != null){
          return HomePage(
            userId: _userId,
            auth: widget.auth,
            logoutCallback: logoutCallback,
          );
        }else{
          return SplashPage();
        }
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return LoginPage(
            auth: widget.auth,
            loginCallback: loginCallback,
        );
        break;
      default:
        return SplashPage();
    }
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    widget.auth.signOut();
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

}
