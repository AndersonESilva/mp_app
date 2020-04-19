import 'package:flutter/material.dart';
import 'package:mp_app/feature/feed/feedAppBar.dart';
import 'package:mp_app/feature/feed/feedPage.dart';
import 'package:mp_app/feature/profile/profileAppBar.dart';
import 'package:mp_app/feature/profile/profilePage.dart';
import 'package:mp_app/manager/authenticationManager.dart';

class HomePage extends StatefulWidget {
  HomePage({this.userId, this.auth, this.logoutCallback});

  final String userId;
  final BaseAuth auth;
  final VoidCallback logoutCallback;

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
        body: RefreshIndicator(
            onRefresh: _refresh, child: _children[_currentIndex]),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dehaze),
          title: Text(''),
        ),
      ],
      currentIndex: _currentIndex,
      fixedColor: Colors.black,
      onTap: (index) {
        _onTabTapped(index);
      },
    );
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    return null;
  }

  AppBar _getAppBar() {
    switch (_currentIndex) {
      case 0:
        {
          return FeedAppBar().build(context);
        }
      case 1:
        {
          return ProfileAppBar(widget.logoutCallback).build(context);
        }
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
