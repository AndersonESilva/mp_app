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
              _buildItemImgEvent(),
              _buildItemFooter()
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
                widget.event.promoter.iconUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.event.promoter.nameDisplay,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 2, bottom: 12),
                    child: Text(
                      widget.event.promoter.city,
                      style: TextStyle(color: Colors.grey[500], fontSize: 11),
                    ),
                  ),
                ],
              ),
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
                style: TextStyle(color: Colors.black, fontSize: 14),
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


