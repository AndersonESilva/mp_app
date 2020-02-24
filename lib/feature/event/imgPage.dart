import 'package:flutter/material.dart';
import 'package:mp_app/manager/permissionsManager.dart';

class ImgPage extends StatefulWidget {

  @override
  _ImgPageState createState() => _ImgPageState();
}

class _ImgPageState extends State<ImgPage> {
  final imgUrl = "https://www.lupadigital.info/wp-content/uploads/2018/05/imagens-gratis.jpg";
  bool downloading = false;
  var progressString = "";

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
                  onPressed: (){
                    PermissionsManager().requestStoragePermission(
                        onPermissionDenied: (){
                          print('Permission has been denied');
                        }
                    );
                  })
            ],
            backgroundColor: Colors.black),
        Image.network(imgUrl,
          fit: BoxFit.cover,
        ),
        CircularProgressIndicator(),
        SizedBox(
          height: 20.0,
        ),
        Text(
          "Downloading File: $progressString",
          style: TextStyle(
            color: Colors.white,
          ),
        )

      ],
    );
  }

}
