import 'dart:convert';

import 'package:api_call_riverpod/model_class.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseURL = 'https://jsonplaceholder.typicode.com';
  static const _endPoint = '/posts';

  Future<List<Post>> getPosts() async {
    var response = await http.get(Uri.parse(_baseURL + _endPoint));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data.map<Post>((json) => Post.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
