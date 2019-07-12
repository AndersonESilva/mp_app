import 'package:flutter/material.dart';

class FeedAppBar extends State<AppBar>{

  String title = "Demo Flutter Mp";

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(title)
    );
  }

}
