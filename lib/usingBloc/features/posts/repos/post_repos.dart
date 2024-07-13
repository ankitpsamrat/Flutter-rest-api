import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/usingBloc/features/posts/models/post_data_model.dart';

class PostRepos {
  //

  static Future<List<PostDataModel>> fetctPosts() async {
    try {
      final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts/');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List<dynamic>;

        List<PostDataModel> posts =
            json.map((data) => PostDataModel.fromJson(data)).toList();

        return posts;
      } else {
        debugPrint('Failed to load posts');
        return [];
      }
    } catch (e) {
      debugPrint('Unable to fetch post: $e');
      return [];
    }
  }
}
