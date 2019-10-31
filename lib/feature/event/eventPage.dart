import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'imgPage.dart';

class EventPage extends StatelessWidget {
  List _toDoList = ["aaa", "sdsds", "fsadfa", "dwa", "dwa", "dwa", "dwa"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([_buildEvent()]),
            ),
            SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return _buildImages(context);
                }, childCount: _toDoList.length))
          ],
        ));
  }

  Widget _buildEvent() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.maxFinite,
              height: 260.0,
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(
                "https://www.privilegebrasil.com//conteudo/anexo/BANNER4.jpg",
                fit: BoxFit.fill,
              )),
          _buildInfo(),
        ]);
  }

  Widget _buildInfo() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Nome do evento', textAlign: TextAlign.right),
        Text('Endereço'),
        Text('Data'),
      ],
    );
  }

  Widget _buildImages(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ImgPage()));
        },
        child: Card(
            child: Container(
                width: double.maxFinite,
                height: 120.0,
                child: Image.network(
                  'http://www.voicers.com.br/wp-content/uploads/2018/09/menos-30-fest-fortaleza-banner-1.jpg',
                  fit: BoxFit.fill,
                ))));
  }
}
