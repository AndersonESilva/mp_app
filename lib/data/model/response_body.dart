
class ResponseBody {

  final int statusCode;
  final Body body;

  ResponseBody(this.statusCode, this.body);

  ResponseBody.fromJson(Map<String, dynamic> json)
      : statusCode = json['statusCode'],
        body = Body.fromJson(json['body']);
}

class Body{

  final String post;
  final String message;

  Body.fromJson(Map<String, dynamic> json)
      : post = json['post'],
        message = json['message'];

}