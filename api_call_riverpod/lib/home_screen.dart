import 'package:api_call_riverpod/model_class.dart';
import 'package:api_call_riverpod/states/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider = StateNotifierProvider<PostsNotifier, PostState>(
  (ref) {
    return PostsNotifier();
  },
);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(postProvider.notifier).getPosts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            PostState state = ref.watch(postProvider);
            if (state is InitialPostState) {
              return const CircularProgressIndicator();
            }
            if (state is PostsLoading) {
              return const CircularProgressIndicator();
            }
            if (state is PostsLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  Post post = state.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              );
            }
            if (state is ErrorPostState) {
              return Text(state.message);
            }
            return const Text('Nothing Found!');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            ref.read(postProvider.notifier).getPosts();
          },
          label: const Text('Fetch List..')),
    );
  }
}
