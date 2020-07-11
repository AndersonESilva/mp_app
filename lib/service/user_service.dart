import 'package:mp_app/data/model/user.dart';
import 'package:mp_app/value/strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService{
  //Singleton
  static final UserService _userService = UserService._internal();

  factory UserService(){
    return _userService;
  }

  UserService._internal();

  String urlBase = Strings.url_users;

  Map<String, String> header =  <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<Null> observe(String idUser, String idEvent) async{
    final urlObserve = urlBase + "/observe";
    final http.Response response = await http.put(
        urlObserve,
        headers: header,
        body: jsonEncode(_toJson(idUser, idEvent))
    );

    Map json = jsonDecode(response.body);

    if(response.statusCode == 200){
      if(json['statusCode'] == 200){
        return;
      }else{
        throw Exception(json['message']);
      }
    }else {
      throw Exception('Failed to load User');
    }
  }

  Future<Null> unobserving(String idUser, String idEvent) async{
    final urlObserve = urlBase + "/unobserving";
    final http.Response response = await http.put(
        urlObserve,
        headers: header,
        body: jsonEncode(_toJson(idUser, idEvent))
    );

    Map json = jsonDecode(response.body);

    if(response.statusCode == 200){
      if(json['statusCode'] == 200){
        return;
      }else{
        throw Exception(json['message']);
      }
    }else {
      throw Exception('Failed to load User');
    }
  }

  Future<User> getUserEmail(String email) async{
    final url = urlBase + "/email/$email";
    final http.Response response = await http.get(
        url
    );

    Map json = jsonDecode(response.body);

    if(response.statusCode == 200){
      if(json['statusCode'] == 200){
        if(json['body'] == null) {
          return null;
        }
        return User.fromJson(json['body']);
      }else{
        throw Exception(json['message']);
      }
    }else {
      throw Exception('Failed to load User');
    }
  }

  Map<String, dynamic> _toJson(String idUser, String idEvent) =>
      {
        'idUser': idUser,
        'idEvent': idEvent
      };

}
