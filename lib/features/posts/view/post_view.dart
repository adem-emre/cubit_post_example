import 'package:cubit_post_example/core/connection/cubit/internet_cubit.dart';
import 'package:cubit_post_example/features/posts/cubit/post_cubit.dart';
import 'package:cubit_post_example/features/posts/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetDisconnected) {
          showConnectionDialog(context);
        } else if (state is InternetConnected) {
          debugPrint(state.connectionType.name);        
        }
      },
      child: Scaffold(
        backgroundColor: Colors.indigo[200],
        appBar: appBar(),
        floatingActionButton: floatingAcitonButton(context),
        body: body(),
      ),
    );
  }

  Future<dynamic> showConnectionDialog(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Icon(
                  Icons.signal_cellular_nodata_rounded,
                  color: Colors.red,
                  size: 96,
                ),
                content: Text(
                  "No Internet Connnection",
                  textAlign: TextAlign.center,
                ),
              );
            });
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Posts"),
    );
  }

  FloatingActionButton floatingAcitonButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.download),
      onPressed: () {
        context.read<PostCubit>().fetchPost();
      },
    );
  }

  Center body() {
    return Center(
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return const Text("Initial State");
          } else if (state is PostLoading) {
            return const CircularProgressIndicator();
          } else if (state is PostCompleted) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  PostModel currentPost = state.posts[index];
                  return Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(18),
                      title: Text(currentPost.title ?? "N/A"),
                      subtitle: Text(currentPost.body ?? "N/A"),
                    ),
                  );
                });
          } else {
            return Text(
                "Bir Hata Oluştu : ${(state as PostError).errorMessage}");
          }
        },
      ),
    );
  }
}
