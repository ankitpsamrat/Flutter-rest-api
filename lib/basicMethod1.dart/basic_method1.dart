import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BasicMethod1 extends StatelessWidget {
  const BasicMethod1({super.key});

  Future<List<dynamic>> _fetchPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Unable to fetch post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _fetchPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text('Error while fetching post');
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Text('No post found');
          }

          final posts = snapshot.data;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              final post = posts[index];

              return ListTile(
                title: Text(post['title']),
                subtitle: Text(post['body']),
              );
            },
          );
        },
      ),
    );
  }
}
