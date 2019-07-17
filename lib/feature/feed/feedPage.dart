import 'package:flutter/material.dart';
import 'package:mp_app/useful/languageBr.dart';

class FeedPage extends StatelessWidget {
  List _toDoList = ["aaa", "sdsds", "fsadfa"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _toDoList.length,
        itemBuilder: (contexto, index) {
          return _buildItem(index);
        });
  }

  Widget _buildItem(int index) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[500],
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: <Widget>[
          _buildItemTitle(),
          Container(
             width: double.maxFinite,
             height: 317.0,
             padding: const EdgeInsets.only(top: 10),
             child: Image.network("https://www.privilegebrasil.com//conteudo/anexo/BANNER4.jpg",
                fit: BoxFit.fill,)
          ),
          _buildItemFooter(),
        ],
      ),
    );
  }

  Widget _buildItemTitle() {
    return Container(
        padding: const EdgeInsets.only(top: 8, left: 13),
        child: Row(
          children: <Widget>[
            Container(
              width: 55.0,
              height: 55.0,
              child: Image.network(
                "https://img.freepik.com/vetores-gratis/night-club-neon-sign_72287-520.jpg?size=338&ext=jpg",
                fit: BoxFit.fill,
        ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 4, bottom: 6),
                    child: Text(
                      LanguageBr.feedPage_text_promoter_name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                  Text(
                    LanguageBr.feedPage_text_promoter_local,
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
      constraints: BoxConstraints(
        maxHeight: 55.0
      ),
      alignment: Alignment.topRight,
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 13.0,
            top: 18.0,
            child: Text(
              LanguageBr.feedPage_text_event_name,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15
              ),
            ),
          ),
          Positioned(
            right: 37.0,
            top: 3.0,
            child: IconButton(icon: Icon(Icons.remove_red_eye),onPressed:(){} ),
          ),
          Positioned(
            right: 0.0,
            top: 3.0,
            child: IconButton(icon: Icon(Icons.share),onPressed:(){} ),
          ),
        ],
      )
    );
  }
}
