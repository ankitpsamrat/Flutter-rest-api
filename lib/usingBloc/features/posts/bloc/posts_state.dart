part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsInitial extends PostsState {}

class PostFetchingLoadingState extends PostsState {}

class PostFetchingErrorState extends PostsState {}

class PostFetchingSuccessfulState extends PostsState {
  final List<PostDataModel> posts;

  PostFetchingSuccessfulState({required this.posts});
}
