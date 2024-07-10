part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class PostInitialFetchEvent extends PostsEvent {}
