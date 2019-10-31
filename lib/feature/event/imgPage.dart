import 'package:flutter/material.dart';

class ImgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
            actions: <Widget>[
              IconButton(
                  icon: new Icon(
                    Icons.file_download,
                    color: Colors.white,
                  ),
                  onPressed: null)
            ],
            backgroundColor: Colors.black),
        Image.network(
          "https://www.lupadigital.info/wp-content/uploads/2018/05/imagens-gratis.jpg",
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
