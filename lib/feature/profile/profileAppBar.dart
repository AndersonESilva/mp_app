import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget{
  ProfileAppBar(this.logoutCallback);

  final VoidCallback logoutCallback;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white10,
      actions: <Widget>[
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.close),
          onPressed: (){
            this.logoutCallback();
          },
        )
      ],
    );
  }

}