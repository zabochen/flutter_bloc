import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/model/comment.dart';
import 'package:flutter_bloc_example/res/strings.dart';
import 'package:flutter_bloc_example/ui/comment_bloc/comment_block.dart';
import 'package:flutter_bloc_example/ui/comment_bloc/comment_event.dart';
import 'package:flutter_bloc_example/ui/comment_bloc/comment_state.dart';

class CommentScreen extends StatefulWidget {
  @override
  CommentScreenState createState() => CommentScreenState();
}

class CommentScreenState extends State {
  @override
  void initState() {
    context.bloc<CommentBloc>().add(GetComments());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.commentScreen_title),
      ),
      body: Container(
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentInitial) {
              return buildTextInfoWidget("CommentScreen Initial");
            } else if (state is CommentLoading) {
              return buildLoadingWidget();
            } else if (state is CommentLoaded) {
              return buildPostListWidget(state.comments);
            } else if (state is CommentError) {
              return buildTextInfoWidget("Error Comment Loading");
            } else {
              return buildTextInfoWidget("ELSE");
            }
          },
        ),
      ),
    );
  }

  Widget buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedWidget(List<Comment> comments) {
    return buildPostListWidget(comments);
  }

  Widget buildPostListWidget(List<Comment> comment) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => _postItemWidget(context, comment[index]),
      itemCount: comment.length,
    );
  }

  Widget _postItemWidget(BuildContext context, Comment comment) {
    return Container(
        margin: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          elevation: 4.0,
          child: InkWell(
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Container(
                  margin: EdgeInsets.all(20.0), child: Text(comment.body)),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("${comment.email}"),
                ));
              }),
        ));
  }

  Widget buildTextInfoWidget(String message) {
    return Center(
      child: Text(message),
    );
  }
}
