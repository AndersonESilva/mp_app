import 'package:flutter/material.dart';
import 'package:mp_app/useful/languageBr.dart';

class ProfilePage extends StatelessWidget {
  List _toDoList = ["aaa"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 40),
          child: CircleAvatar(
            radius: 70,
              child: ClipOval(
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: Image.network("https://abrilexame.files.wordpress.com/2018/10/capaprofile.jpg",
                  fit: BoxFit.fill,),
                ),
              )),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Text(LanguageBr.profilePage_text_name,
                  style: TextStyle(
                    fontSize: 25.0
                  )),
              Text(LanguageBr.profilePage_text_Local,
                  style: TextStyle(
                    color: Colors.grey[500],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
