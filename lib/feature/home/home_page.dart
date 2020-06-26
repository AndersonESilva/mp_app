import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/bloc/feed_bloc.dart';
import 'package:mp_app/data/model/user.dart';
import 'package:mp_app/di/event/feed_event.dart';
import 'package:mp_app/feature/feed/feed_app_bar.dart';
import 'package:mp_app/feature/feed/feed_page.dart';
import 'package:mp_app/feature/profile/profile_app_bar.dart';
import 'package:mp_app/feature/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  HomePage({this.user});

  final User user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = [FeedPage(), ProfilePage()];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar(),
        body: BlocProvider(
          create: (context) => FeedBloc(widget.user)..add(Fetch()),
          child: _children[_currentIndex],
        ),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  BottomNavigationBarItem _buildNavigationBarItem(String text, IconData icon, bool isSelected) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: isSelected ? Colors.orange : Colors.white,),
      title: Text(text,
          style: TextStyle(
              color: isSelected ? Colors.orange : Colors.white
          )),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.grey[900],
      items: <BottomNavigationBarItem>[
        _buildNavigationBarItem('Feed', Icons.home, _currentIndex == 0),
        _buildNavigationBarItem('Perfil', Icons.dehaze, _currentIndex == 1)
      ],
      currentIndex: _currentIndex,
      fixedColor: Colors.black,
      onTap: (index) {
        _onTabTapped(index);
      },
    );
  }

  AppBar _getAppBar() {
    switch (_currentIndex) {
      case 0:
        {
          return FeedAppBar().build(context);
        }
      case 1:
        {
          return ProfileAppBar(null).build(context);
        }
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
