import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mp_app/feature/register/register_screen.dart';

class RegisterOptions extends StatefulWidget {

  RegisterOptions({Key key})
      : super(key: key);

  State<RegisterOptions> createState() => _RegisterOptionsState();
}

class _RegisterOptionsState extends State<RegisterOptions> {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: Column(
        children: <Widget>[
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.close),
              onPressed: (){
                Navigator.of(context).pop();
              }),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('Criar conta no Momp'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('Crie um perfil, siga.....fdsfsdfsadfsa...sadfafd'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: _showSocialButton(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.green,
              child: Text('Crie um perfil, siga.....fdsfsdfsadfsa...sadfafd'),
            ),
            Row(
                children: <Widget>[
                  Text('Já tem uma conta: '),
                  Text('Entrar', style: TextStyle(color: Colors.redAccent)),
                ]
            ),
          ],
        ),
        color: Colors.lime,
      ),
    );
  }

  Widget _showSocialButton(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _emailCreateButton(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: _facebookCreateButton(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: _googleCreateButton(),
          )
        ],
      ),
    );
  }

  Widget _emailCreateButton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(FontAwesomeIcons.user, color: Colors.white),
      label: Text('User e-mail', style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen();
          }),
        );
      },
    );
  }

  Widget _facebookCreateButton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(FontAwesomeIcons.facebook, color: Colors.white),
      label: Text('Continuar com Facebook', style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
      onPressed: () {
      //
      },
    );
  }

  Widget _googleCreateButton(){
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(FontAwesomeIcons.google, color: Colors.white),
      label: Text('Continuar com Google', style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
      onPressed: () {
        //
      },
    );
  }
}
