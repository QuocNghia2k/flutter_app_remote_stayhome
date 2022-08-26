import '../dataSource/entiti/post.dart';
import '../dataSource/service/post_service.dart';

abstract class PostReository {
  Future<List<Post>> getAllPost();
  Future addPost(Post booking);
  Future updatePost(Post booking);
}

class PostReositoryImpl implements PostReository {
  PostService postService = PostService();
  @override
  Future addPost(Post post) async {
    return postService.addPost(post);
  }

  @override
  Future<List<Post>> getAllPost() async {
    return await postService.getAllPost();
  }

  @override
  Future updatePost(Post post) {
    return postService.updatePost(post);
  }
}
