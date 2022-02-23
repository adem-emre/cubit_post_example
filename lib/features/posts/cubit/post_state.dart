part of 'post_cubit.dart';

@immutable
abstract class PostState{}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostCompleted extends PostState {
  final List<PostModel> posts;
  PostCompleted(
     this.posts,
  );
}

class PostError extends PostState {}




