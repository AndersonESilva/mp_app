import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  List _toDoList = ["aaa", "sdsds", "fsadfa", "dwa"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: _toDoList.length,
        itemBuilder: (contexto, index) {
          return _buildItem(index);
        });
  }

  Widget _buildItem(int index) {
    return Column(
      children: <Widget>[
        _buildItemTitle(),
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Image.asset('images/ferrari.jpg'),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(
            'Kandersteg, Switzerland',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ),
        _buildItemFooter()
      ],
    );
  }

  Widget _buildItemTitle() {
    return Container(
        padding: const EdgeInsets.only(top: 8, left: 8),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Image.asset('images/ferrari.jpg'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 4, bottom: 6),
                    child: Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildItemFooter() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.insert_drive_file)),
          IconButton(onPressed: () {}, icon: Icon(Icons.attach_file)),
        ],
      ),
    );
  }
}
