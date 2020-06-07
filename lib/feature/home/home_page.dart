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
        body: RefreshIndicator(
            onRefresh: _refresh,
            child: BlocProvider(
                create: (context) => FeedBloc(widget.user)..add(Fetch()),
                child: _children[_currentIndex],
            )
        ),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Feed'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dehaze),
          title: Text('Perfil'),
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
