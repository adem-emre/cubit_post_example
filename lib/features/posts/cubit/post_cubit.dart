import 'package:cubit_post_example/features/posts/model/post_model.dart';
import 'package:cubit_post_example/features/posts/service/post_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  void fetchPost()async{
    try {
      emit(PostLoading());
      List<PostModel> postList = await PostService().fetchPosts();
      emit(PostCompleted(postList));
    } catch (e) {
      emit(PostError());
    }
  }
}
