import 'package:flutter/material.dart';
import 'package:mp_app/feature/event/eventPage.dart';
import 'package:mp_app/useful/languageBr.dart';

class FeedPage extends StatelessWidget {
  List _toDoList = ["aaa", "sdsds", "fsadfa"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _toDoList.length,
        itemBuilder: (contexto, index) {
          return _buildItem(context, index);
        });
  }

  Widget _buildItem(BuildContext context, int index) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300],
              width: 2,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            _buildItemTitle(),
            _buildItemImgEvent(context, index),
            _buildItemFooter(),
          ],
        ),
      )
    );
  }

  Widget _buildItemTitle() {
    return Container(
        padding: const EdgeInsets.only(top: 2, left: 13),
        child: Row(
          children: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              child: Image.network(
                "https://img.freepik.com/vetores-gratis/night-club-neon-sign_72287-520.jpg?size=338&ext=jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageBr.feedPage_text_promoter_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 2, bottom: 12),
                    child: Text(
                      LanguageBr.feedPage_text_promoter_local,
                      style: TextStyle(color: Colors.grey[500], fontSize: 11),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildItemImgEvent(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EventPage()));
        },
        child: Container(
            width: double.maxFinite,
            height: 210.0,
            padding: const EdgeInsets.only(top: 10),
            child: Image.network(
              "https://www.privilegebrasil.com//conteudo/anexo/BANNER4.jpg",
              fit: BoxFit.fill,
            )));
  }

  Widget _buildItemFooter() {
    return Container(
        constraints: BoxConstraints(maxHeight: 45.0),
        alignment: Alignment.topRight,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 10.0,
              top: 14.0,
              child: Text(
                LanguageBr.feedPage_text_event_name,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Positioned(
              right: 34.0,
              top: 0.0,
              child: IconButton(
                  icon: Icon(Icons.remove_red_eye), iconSize: 20, onPressed: () {}),
            ),
            Positioned(
              right: 0.0,
              top: 0.0,
              child: IconButton(icon: Icon(Icons.send), iconSize: 20, onPressed: () {}),
            ),
          ],
        ));
  }
}
