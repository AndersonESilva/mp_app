import 'package:flutter/material.dart';

import 'data_seach.dart';

class SeachAppBar extends StatelessWidget{

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){
            showSearch(
                context: context,
                delegate: DataSeach());
          },
        )
      ],
    );
  }

}