import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/bloc/authentication_bloc.dart';
import 'package:mp_app/di/event/authentication_event.dart';

class ProfileAppBar extends StatelessWidget{
  ProfileAppBar(this.logoutCallback);

  final VoidCallback logoutCallback;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white10,
      actions: <Widget>[
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.close),
          onPressed: (){
            return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Sair'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Tem certeza que deseja sair?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Sim'),
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context).add(
                          AuthenticationLoggedOut(),
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text('Não'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        )
      ],
    );
  }

  Future<void> _neverSatisfied(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}