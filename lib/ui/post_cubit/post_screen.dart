import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/model/post.dart';
import 'package:flutter_bloc_example/res/strings.dart';
import 'package:flutter_bloc_example/ui/post_cubit/post_cubit.dart';
import 'package:flutter_bloc_example/ui/post_cubit/post_state.dart';

class PostScreen extends StatefulWidget {
  @override
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends State {
  @override
  void initState() {
    BlocProvider.of<PostCubit>(context).getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.newsScreen_title),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, postState) {
          if (postState is PostInitial) {
            return buildInitialWidget();
          } else if (postState is PostLoading) {
            return buildLoadingWidget();
          } else if (postState is PostLoaded) {
            return buildLoadedWidget(postState.posts);
          } else if (postState is PostError) {
            return buildErrorWidget(postState.message);
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget buildInitialWidget() {
    return Center(
      child: RaisedButton(
        child: Text("Load data"),
      ),
    );
  }

  Widget buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedWidget(List<Post> posts) {
    return buildPostListWidget(posts);
  }

  var dividerWidget = Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Divider(
      height: 1,
      thickness: 1,
      color: Colors.black38,
    ),
  );

  Widget buildPostListWidget(List<Post> posts) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => dividerWidget,
      itemBuilder: (context, index) => _postItemWidget(context, posts[index]),
      itemCount: posts.length,
    );
  }

  Widget _postItemWidget(BuildContext context, Post post) {
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
                  margin: EdgeInsets.all(20.0), child: Text(post.body)),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("${post.title}"),
                ));
              }),
        ));
  }

  Widget buildErrorWidget(String message) {
    return Center(
      child: Text(message),
    );
  }
}
