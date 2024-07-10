import 'package:flutter/material.dart';
import 'package:rest_api/usingBloc/features/posts/bloc/posts_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  //

  final PostsBloc _postsBloc = PostsBloc();

  // @override
  // void initState() {
  //   super.initState();

  //   _postsBloc.add(PostInitialFetchEvent());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: TextField(),
    );
  }
}
