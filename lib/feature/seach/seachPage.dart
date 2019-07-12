
import 'package:flutter/material.dart';

class SeachPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Peso (Kg)",
                labelStyle: TextStyle(color: Colors.green)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 20.00),
            //controller: weightControl,
            validator: (value) {
              if (value.isEmpty) {
                return "Insira seu Peso:";
              }
            }),
      ],
    );
  }


}