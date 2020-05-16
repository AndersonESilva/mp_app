import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mp_app/data/model/response_body.dart';
import 'package:mp_app/data/model/user.dart';
import 'package:mp_app/value/strings.dart';

class MainService{
  //Singleton
  static final MainService _mainService = MainService._internal();

  factory MainService(){
    return _mainService;
  }

  MainService._internal();

  String urlAuth = Strings.url_authentication;

  Map<String, String> header =  <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<User> authentication(User user) async{
    final http.Response response = await http.post(
        urlAuth,
        headers: header,
        body: jsonEncode(user.toJson())
    );

    Map json = jsonDecode(response.body);

    print(response.body);

    ResponseBody responseObj = ResponseBody.fromJson(json);

    if(response.statusCode == 200){
      Map userjson = jsonDecode(responseObj.body.post);

      if(responseObj.statusCode == 200){
        return User.fromJson(userjson);
      }else{
        throw Exception(responseObj.body.message);
      }
    }else {
      throw Exception('Failed to load album');
    }
  }

}
