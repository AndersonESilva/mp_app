import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget{

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: (){},
        )
      ],
    );
  }

}