import 'package:flutter/material.dart';
import 'package:mp_app/feature/home/homePage.dart';
import 'package:mp_app/feature/login/loginPage.dart';

void main() => runApp(MyApp());

typedef SplashBuilderFn = Widget Function(BuildContext context);

typedef LoginBuilderFn = Widget Function(BuildContext context);

typedef HomeBuilderFn = Widget Function(BuildContext context);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLUTTER",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(
        splashBuilder: (context) {
          return null;
        },
        loginBuilder: (context) {
          return LoginPage();
        },
        homeBuilder: (context) {
          return HomePage();
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final SplashBuilderFn splashBuilder;
  final LoginBuilderFn loginBuilder;
  final HomeBuilderFn homeBuilder;

  MainPage({this.splashBuilder, this.loginBuilder, this.homeBuilder});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return widget.homeBuilder(context);
  }
}
