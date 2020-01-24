import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

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
                  onPressed: downloadFile)
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

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();

      await dio.download(imgUrl, "${dir.path}/myimage.jpg",
          onReceiveProgress: (rec, total) {
            print("Rec: $rec , Total: $total");

            setState(() {
              downloading = true;
              progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
            });
          });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

}
