import 'package:flutter/material.dart';

class SeachPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white12,
                elevation: 0.0,
                flexibleSpace: SafeArea(
                  child: _getTabBar(),
                ),
              ),
              body: TabBarView(
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getTabBar(){
    return TabBar(
      labelColor: Colors.grey[500],
      indicatorColor: Colors.grey[500],
      tabs: [
        Tab(text: "promo"),
        Tab(text: "evnt")
      ],
    );
  }
}
