import 'package:flutter_bloc_example/model/comment.dart';

abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> comments;

  CommentLoaded(this.comments);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentLoaded &&
          runtimeType == other.runtimeType &&
          comments == other.comments;

  @override
  int get hashCode => comments.hashCode;
}

class CommentError extends CommentState {}
