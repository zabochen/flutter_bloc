import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/data/network_service.dart';
import 'package:flutter_bloc_example/res/strings.dart';
import 'package:flutter_bloc_example/ui/home/home.dart';
import 'package:flutter_bloc_example/ui/post_cubit/post_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NetworkService(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PostCubit>(
            create: (context) =>
                PostCubit(networkService: context.repository<NetworkService>()),
          ),
        ],
        child: MaterialApp(
          title: Strings.appName,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
