import 'package:flutter/material.dart';
import 'package:mp_app/data/model/event.dart';
import 'package:mp_app/feature/event/event_page.dart';
import 'package:mp_app/value/strings.dart';

class FeedWidgetEvent extends StatelessWidget {
  final Event event;

  const FeedWidgetEvent({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              _buildItemImgEvent(context, 1),
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
                event.promoter.iconUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.promoter.nameDisplay,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 2, bottom: 12),
                    child: Text(
                      event.promoter.city,
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
              event.banner,
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
                event.title,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Positioned(
              right: 0.0,
              top: 0.0,
              child: IconButton(
                  icon: Icon(Icons.remove_red_eye), iconSize: 20, onPressed: () {}),
            )
          ],
        ));
  }

}