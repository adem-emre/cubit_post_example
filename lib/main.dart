import 'package:cubit_post_example/features/posts/cubit/post_cubit.dart';
import 'package:cubit_post_example/features/posts/view/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BlocProvider(
        create: (context) => PostCubit(),
        child: const PostView(),
      ),
    );
  }
}
