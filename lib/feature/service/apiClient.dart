import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mp_app/modal/events.dart';

class ApiClient {

  String _url = "https://api.github.com/";

  seach(String query) async{

    http.Response response = await http.get(
      _url+"events"
    );

    return decode(response);
  }

  decode(http.Response response) {

    if(response.statusCode == 200){

      var decoded = json.decode(response.body);

      List<Events> videos = decoded["items"].map<Events>(
        (map){
          return Events.fromJson(map);
        }
      ).toList();

      return videos;
    }else {
      throw Exception("Failed to load videos");
    }

  }
}