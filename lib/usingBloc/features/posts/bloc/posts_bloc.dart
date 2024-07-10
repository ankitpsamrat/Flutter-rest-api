import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:meta/meta.dart';

import 'package:rest_api/usingBloc/features/posts/models/post_data_model.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  Future<FutureOr<void>> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        List<PostDataModel> posts =
            json.map((data) => PostDataModel.fromJson(data)).toList();

        // PostDataModel.fromJson(json) as Map<String, dynamic> ;
      } else {
        debugPrint('Failed to load post');
      }
    } catch (e) {
      debugPrint('Unable to fetch post: $e');
    }
  }
}
