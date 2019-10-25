import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mp_app/feature/event/eventPage.dart';
import 'package:mp_app/useful/languageBr.dart';

class ProfilePage extends StatelessWidget {
  List _toDoList = ["aaa", "sdsds", "fsadfa", "dwa", "dwa", "dwa", "dwa"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate(
                  [_buildProfileImage(), _buildProfileData(), _buildDetail()])),
          SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return _buildItems(index, context);
              }, childCount: _toDoList.length))
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      alignment: Alignment.center,
      child: CircleAvatar(
          radius: 70,
          child: ClipOval(
            child: SizedBox(
              width: 140,
              height: 140,
              child: Image.network(
                "https://abrilexame.files.wordpress.com/2018/10/capaprofile.jpg",
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }

  Widget _buildProfileData() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Text(LanguageBr.profilePage_text_full_name,
              style: TextStyle(fontSize: 25.0)),
          Text(LanguageBr.profilePage_text_local,
              style: TextStyle(
                color: Colors.grey[500],
              )),
        ],
      ),
    );
  }

  Widget _buildDetail() {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[500],
              width: 0.8,
            ),
          ),
        ),
        margin: const EdgeInsets.only(top: 35));
  }

  Widget _buildItems(int index, BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EventPage()));
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                  width: double.maxFinite,
                  height: 120.0,
                  child: Image.network(
                    'http://www.voicers.com.br/wp-content/uploads/2018/09/menos-30-fest-fortaleza-banner-1.jpg',
                    fit: BoxFit.fill,
                  )),
              Container(
                  child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 5),
                    child: Text(LanguageBr.profilePage_text_event_name,
                        style: TextStyle(
                          color: Colors.grey[500],
                        )),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
