import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/res/strings.dart';
import 'package:flutter_bloc_example/ui/comment_bloc/comment_screen.dart';
import 'package:flutter_bloc_example/ui/post_cubit/post_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.homeScreen_title),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text(Strings.homeScreen_openCubitPostScreen),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostScreen(),
                        ));
                  },
                ),
                RaisedButton(
                  child: Text(Strings.homeScreen_openBlocCommentScreen),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommentScreen(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
