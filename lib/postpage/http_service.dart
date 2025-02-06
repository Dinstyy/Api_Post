import 'dart:convert';
import 'package:http/http.dart'; // Tambahkan ini
import '../../post/post_model.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postsURL)); // Tambahkan http. sebelum Response dan get
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
