import 'package:http/http.dart' as http;

class FeedRepository{

  Future<http.Response> fetchEvents() async {
    return http.get('https://jsonplaceholder.typicode.com/posts/1');
  }
}