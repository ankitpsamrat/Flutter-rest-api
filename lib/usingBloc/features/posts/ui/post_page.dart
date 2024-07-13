import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/usingBloc/features/posts/bloc/posts_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  //

  final PostsBloc _postsBloc = PostsBloc();

  @override
  void initState() {
    super.initState();

    _postsBloc.add(PostInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: _postsBloc,
        listenWhen: (previous, current) => current is PostsActionState,
        buildWhen: (previous, current) => current is! PostsActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostFetchingLoadingState:
              return const Center(child: CircularProgressIndicator());

            case PostFetchingSuccessfulState:
              final successState = state as PostFetchingSuccessfulState;

              return ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  final postData = successState.posts[index];

                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(10),
                    color: Colors.green.shade100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(postData.title),
                        Text(postData.body),
                      ],
                    ),
                  );
                },
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
