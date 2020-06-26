import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/bloc/observation_bloc.dart';
import 'package:mp_app/data/model/event.dart';
import 'package:mp_app/data/model/user.dart';
import 'package:mp_app/di/event/observation_event.dart';
import 'package:mp_app/feature/event/event_page.dart';
import 'package:mp_app/feature/event/observation_widget.dart';

class FeedWidgetEvent extends StatefulWidget {
  final Event event;
  final User user;

  const FeedWidgetEvent({Key key, @required this.event, @required this.user}) : super(key: key);

  @override
  _FeedWidgetEventState createState() => _FeedWidgetEventState();
}

class _FeedWidgetEventState extends State<FeedWidgetEvent> {

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          child: Container(
            padding: EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[
                _buildItemTitle(),
                _buildItemImgEvent(),
                _buildItemFooter()
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey[850]
            ),
          ),
        )
    );
  }

  Widget _buildItemTitle() {
    return Container(
        padding: const EdgeInsets.only(top: 2, left: 12, right: 12),
        child: Row(
          children: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              child: Image.network(
                widget.event.promoter.iconUrl,
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[500], width: 2),
              ),
            ),
            Expanded(child: Container(
              height: 40.0,
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.promoter.nameDisplay,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        widget.event.promoter.city,
                        style: TextStyle(color: Colors.grey[500], fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),),
            Container(
              child: Text('30 JUL',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            )
          ],
        )
    );
  }

  Widget _buildItemImgEvent() {
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
              widget.event.banner,
              fit: BoxFit.fill,
            )
        )
    );
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
                widget.event.title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            BlocProvider(
              create: (context) => ObservationBloc(widget.user.id)..add(ObservationInit(widget.event.observed)),
              child: ObservationWidget(event: widget.event),
            )
          ],
        )
    );
  }
}


