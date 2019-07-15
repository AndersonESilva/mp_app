import 'package:flutter/material.dart';
import 'package:mp_app/useful/languageBr.dart';

class ProfilePage extends StatelessWidget {
  List _toDoList = ["aaa"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildProfileImage(),
        _buildProfileData(),
        _buildEvents()
      ],
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
          Text(LanguageBr.profilePage_text_name,
              style: TextStyle(fontSize: 25.0)),
          Text(LanguageBr.profilePage_text_Local,
              style: TextStyle(
                color: Colors.grey[500],
              )),
        ],
      ),
    );
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
          children: List.generate(choices.length, (index) {
            return Center(
              child: ChoiceCard(choice: choices[index]),
            );
          })),
    ));
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.drafts),
  const Choice(title: 'Boat', icon: Icons.dvr),
  const Choice(title: 'Bus', icon: Icons.copyright),
  const Choice(title: 'Train', icon: Icons.cloud_off),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.drafts),
  const Choice(title: 'Boat', icon: Icons.dvr),
  const Choice(title: 'Bus', icon: Icons.copyright),
  const Choice(title: 'Train', icon: Icons.cloud_off),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.drafts),
  const Choice(title: 'Boat', icon: Icons.dvr),
  const Choice(title: 'Bus', icon: Icons.copyright),
  const Choice(title: 'Train', icon: Icons.cloud_off),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(choice.icon, size: 80.0, color: textStyle.color),
                Text(choice.title, style: textStyle),
              ]),
        ));
  }
}
