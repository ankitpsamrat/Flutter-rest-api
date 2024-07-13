import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:rest_api/usingBloc/features/posts/models/post_data_model.dart';
import 'package:rest_api/usingBloc/features/posts/repos/post_repos.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  Future<FutureOr<void>> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostFetchingLoadingState());

    List<PostDataModel> posts = await PostRepos.fetctPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }
}
