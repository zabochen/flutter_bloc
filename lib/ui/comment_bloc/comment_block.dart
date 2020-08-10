import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/data/network_service.dart';
import 'package:flutter_bloc_example/model/comment.dart';
import 'package:flutter_bloc_example/ui/comment_bloc/comment_event.dart';
import 'package:flutter_bloc_example/ui/comment_bloc/comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final NetworkService networkService;

  CommentBloc({@required this.networkService}) : super(CommentInitial());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is GetComments) {
      yield CommentLoading();
      try {
        List<Comment> comments = await networkService.fetchComments();
        yield CommentLoaded(comments);
      } catch (e) {
        yield CommentError();
      }
    }
  }
}
