import 'dart:convert';
import 'package:flutter_bloc_example/model/post.dart';
import 'package:http/http.dart';

const String BASE_URL = "https://jsonplaceholder.typicode.com/";
const String POSTS = "posts";

class NetworkService {
  Future<List<Post>> fetchPosts() async {
    Response response = await get(BASE_URL + POSTS);
    List decodeResponse = json.decode(response.body);
    return decodeResponse.map((value) => Post.fromJson(value)).toList();
  }
}
