import 'package:flutter/material.dart';

import 'feature/feed/feedAppBar.dart';
import 'feature/feed/feedPage.dart';
import 'feature/profile/profileAppBar.dart';
import 'feature/profile/profilePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Widget> _children = [
    FeedPage(),
    ProfilePage()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: _children[_currentIndex]
        ),
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
      onTap: (index){
        _onTabTapped(index);
      },
    );
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    return null;
  }

  AppBar getAppBar() {
    switch (_currentIndex) {
      case 0:
        {
          return FeedAppBar().build(context);
        }
      case 1:
        {
          return ProfileAppBar().build(context);
        }
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}
