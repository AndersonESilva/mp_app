import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Center(
            child: Image.asset('images/ferrari.jpg'),
          ),
        )
      ],
    );
  }

}