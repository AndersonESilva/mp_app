import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/bloc/observation_bloc.dart';
import 'package:mp_app/data/model/event.dart';
import 'package:mp_app/di/event/observation_event.dart';
import 'package:mp_app/di/state/observation_state.dart';

class ObservationWidget extends StatefulWidget{
  final Event event;

  const ObservationWidget({Key key, this.event}) : super(key: key);

  @override
  _ObservationWidget createState() => _ObservationWidget();
}

class _ObservationWidget extends State<ObservationWidget> {
  ObservationBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ObservationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObservationBloc, ObservationState>(
      // ignore: missing_return
        builder: (context, state){
          if (state is Uninitialized){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is Observing){
            return Positioned(
              right: 0.0,
              top: 0.0,
              child: IconButton(
                  icon: Icon(Icons.remove_red_eye, color: Colors.white,),
                  iconSize: 20,
                  onPressed: (){_bloc.add(ObservationChange(widget.event.id));}
                  ),
            );
          }

          if(state is UnObserving){
            return Positioned(
              right: 0.0,
              top: 0.0,
              child: IconButton(
                  icon: Icon(Icons.remove_circle_outline, color: Colors.white,),
                  iconSize: 20,
                  onPressed: () {_bloc.add(ObservationChange(widget.event.id));}
                  ),
            );
          }

        }
    );
  }
}
