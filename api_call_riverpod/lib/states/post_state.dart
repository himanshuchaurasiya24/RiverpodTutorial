import 'package:api_call_riverpod/api_service.dart';
import 'package:api_call_riverpod/model_class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



@immutable
abstract class PostState {}

class InitialPostState extends PostState {
  // const InitialPostState();
}

class PostsLoading extends PostState {
  // const PostLoading();
}

class PostsLoaded extends PostState {
  final List<Post> posts;
  PostsLoaded({required this.posts});
}

class ErrorPostState extends PostState {
  final String message;
  ErrorPostState({required this.message});
}

class PostsNotifier extends StateNotifier<PostState> {
  PostsNotifier() : super(PostsLoading());
  void getPosts() async {
    state = PostsLoading();
    try {
      var posts = await ApiService().getPosts();
      state = PostsLoaded(posts: posts);
    } catch (e) {
      state = ErrorPostState(message: e.toString());
    }
  }
}
