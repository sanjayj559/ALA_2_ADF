import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
        final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=50')
    );

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}