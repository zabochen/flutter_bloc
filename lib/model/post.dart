// https://jsonplaceholder.typicode.com/
//  {
//    "userId": 1,
//    "id": 1,
//    "title": "",
//    "body": ""
//  }

// Guide
// https://flutter.dev/docs/cookbook/networking/background-parsing

import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  @override
  List<Object> get props => [userId, id, title, body];

  @override
  bool get stringify => true;
}
