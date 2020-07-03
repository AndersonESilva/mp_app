import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:mp_app/util/permissions_manager.dart';

class ImagePage extends StatefulWidget {

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final imgUrl = "https://www.lupadigital.info/wp-content/uploads/2018/05/imagens-gratis.jpg";
  bool downloading = false;
  var progressString = "";

  String _message = "";
  String _path = "";
  String _size = "";
  String _mimeType = "";
  File _imageFile;
  int _progress = 0;

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
                  onPressed: _imageDownload)
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

  Future<void> _imageDownload() async {
    var permission = await PermissionsManager().hasStoragePermission();
    if(permission){
      _downloadImage();
    }else{
      var afterPermission = await PermissionsManager().requestStoragePermission(
          onPermissionDenied: (){
            print('Permission has been denied');
          }
      );

      if(afterPermission){
        _imageDownload();
      }
    }
  }

  Future<void> _downloadImage({AndroidDestinationType destination, bool whenError = false}) async {
    String fileName;
    String path;
    int size;
    String mimeType;
    try {
      String imageId;

      if (whenError) {
        imageId = await ImageDownloader.downloadImage(imgUrl).catchError((error) {
          if (error is PlatformException) {
            var path = "";
            if (error.code == "404") {
              print("Not Found Error.");
            } else if (error.code == "unsupported_file") {
              print("UnSupported FIle Error.");
              path = error.details["unsupported_file_path"];
            }
            setState(() {
              _message = error.toString();
              _path = path;
            });
          }

          print(error);
        }).timeout(Duration(seconds: 10), onTimeout: () {
          print("timeout");
        });
      } else {
        if (destination == null) {
          imageId = await ImageDownloader.downloadImage(imgUrl);
        } else {
          imageId = await ImageDownloader.downloadImage(
            imgUrl,
            destination: destination,
          );
        }
      }

      if (imageId == null) {
        return;
      }
      fileName = await ImageDownloader.findName(imageId);
      path = await ImageDownloader.findPath(imageId);
      size = await ImageDownloader.findByteSize(imageId);
      mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      setState(() {
        _message = error.message;
      });
      return;
    }

    if (!mounted) return;

    setState(() {
      var location = Platform.isAndroid ? "Directory" : "Photo Library";
      _message = 'Saved as "$fileName" in $location.\n';
      _size = 'size:     $size';
      _mimeType = 'mimeType: $mimeType';
      _path = path;

      if (!_mimeType.contains("video")) {
        _imageFile = File(path);
      }
    });
  }

}
