import 'package:mp_app/value/strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository{
  //Singleton
  static final UserRepository _userRepository = UserRepository._internal();

  factory UserRepository(){
    return _userRepository;
  }

  UserRepository._internal();

  String urlUsers = Strings.url_users;

  Map<String, String> header =  <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<Null> observe(String idUser, String idEvent) async{
    final urlObserve = urlUsers + "/observe";
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
    final urlObserve = urlUsers + "/unobserving";
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

  Map<String, dynamic> _toJson(String idUser, String idEvent) =>
      {
        'idUser': idUser,
        'idEvent': idEvent
      };

}
