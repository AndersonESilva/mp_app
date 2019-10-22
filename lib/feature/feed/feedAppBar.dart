import 'package:flutter/material.dart';

class FeedAppBar extends State<AppBar>{

  String title = "Demo Flutter Mp";

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.indigo[300],
          fontSize: 20.0
        )
      ),
    );
  }

}
