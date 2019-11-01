import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mp_app/data/model/eventResponse.dart';

class FeedRepository{

  Future<EventResponse> fetchEvents() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if(response.statusCode == 200){
      return EventResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }
}