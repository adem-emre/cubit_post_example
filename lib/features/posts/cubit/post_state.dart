part of 'post_cubit.dart';

@immutable
abstract class PostState extends Equatable{

  @override
  List<Object?> get props => [];


}

class PostInitial extends PostState {
}

class PostLoading extends PostState {}

class PostCompleted extends PostState {
  final List<PostModel> posts;
  PostCompleted(
     this.posts,
  );

  @override
  List<Object?> get props => [posts];
}

class PostError extends PostState {}




