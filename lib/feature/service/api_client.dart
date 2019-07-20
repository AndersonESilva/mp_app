import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mp_app/modal/events.dart';

class ApiClient {

  String _url = "https://api.github.com/";

  Future<List<Events>> search(String query) async{

    http.Response response = await http.get(
      _url+"events"
    );

    return _decode(response);
  }

  List<Events> _decode(http.Response response) {

    if(response.statusCode == 200){

      var decoded = json.decode(response.body);

      return decoded.map<Events>(
        (map){
          return Events.fromJson(map);
        }
      ).toList();

    }else {
      throw Exception("Failed to load videos");
    }

  }
}