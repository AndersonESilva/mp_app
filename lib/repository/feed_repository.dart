import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mp_app/data/model/event.dart';
import 'package:mp_app/value/strings.dart';

class FeedRepository{
  //Singleton
  static final FeedRepository _feedRepository = FeedRepository._internal();

  factory FeedRepository(){
    return _feedRepository;
  }

  FeedRepository._internal();

  String urlEvent = Strings.url_events;

  Map<String, String> header =  <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<List<Event>> fetchEvents(String userId, String endEventId) async {
    int page = 1;
    if(endEventId != null){
      page = 2;
    }
    final urlEventFetch = urlEvent + "/p/$page";
    final http.Response response = await http.post(
        urlEventFetch,
        headers: header,
        body: jsonEncode(_toJson(userId, endEventId))
    );

    Map json = jsonDecode(response.body);

    if(response.statusCode == 200){
      if(json['statusCode'] == 200){
        final data = json['body'] as List;
        return data.map((rawPost) {
          return Event.fromJson(rawPost);
        }).toList();
      }else{
        throw Exception(json['message']);
      }
    }else {
      throw Exception('Failed to load User');
    }
  }

  Map<String, dynamic> _toJson(String userId, String endEventId) =>
      {
        'userId': userId,
        'startEventId': endEventId
      };

}