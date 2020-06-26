import 'package:flutter/material.dart';

class FeedAppBar extends State<AppBar>{

  String title = "Demo Flutter Mp";

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[900],
      title: Image.asset('images/momplogo.png'),
    );
  }

}
