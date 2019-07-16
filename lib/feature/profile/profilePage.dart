import 'package:flutter/material.dart';
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
                return _buildItems(index);
              }, childCount: _toDoList.length))
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 40),
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

  Widget _buildEvents() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey[500],
            width: 1.5,
          ),
        ),
      ),
      margin: const EdgeInsets.only(top: 35),
      child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(13, (index) {
            return Center(
              child: _buildItems(index),
            );
          })),
    ));
  }

  Widget _buildItems(int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topCenter,
              width: double.maxFinite,
              height: 120.0,
              child: Image.asset(
                'images/ferrari.jpg',
                fit: BoxFit.fill,
              )),
          Container(
              margin: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 5,bottom: 5),
                      child: Text(
                        LanguageBr.profilePage_text_event_name,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        LanguageBr.profilePage_text_event_local,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          LanguageBr.profilePage_text_event_date,
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
