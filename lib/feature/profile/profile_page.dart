import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mp_app/feature/event/event_page.dart';
import 'package:mp_app/value/strings.dart';

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
        width: 140,
        height: 140,
        child: Container(
          alignment: Alignment.center,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 67,
              child: ClipOval(
                child: SizedBox(
                  width: 126,
                  height: 126,
                  child: Image.network(
                    "https://media.licdn.com/dms/image/C4E03AQHl4IZjw5Fn-w/profile-displayphoto-shrink_200_200/0?e=1580342400&v=beta&t=4bR6JkUb5p_gIucZ7nNKvLbZYPXkqkIxF6czUh5eWQM",
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          decoration:
              BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
        ));
  }

  Widget _buildProfileData() {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          Text(Strings.profilePage_text_full_name,
              style: TextStyle(fontSize: 18.0)),
          Text(Strings.profilePage_text_local,
              style: TextStyle(color: Colors.grey[500], fontSize: 14.0)),
        ],
      ),
    );
  }

  Widget _buildDetail() {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[300],
              width: 2.4,
            ),
          ),
        ),
        margin: const EdgeInsets.only(top: 15));
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
                margin: const EdgeInsets.only(top: 14, bottom: 4),
                child: Text(Strings.profilePage_text_event_name,
                    style:
                    TextStyle(color: Colors.grey[500], fontSize: 12.0)),
              )
            ],
          ),
        ));
  }
}
