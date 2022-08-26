import 'package:flutter/cupertino.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/post.dart';
import 'package:flutter_app_remote_stayhome/data/repositories/post_repository.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _list = [];
  PostReository postReository = PostReositoryImpl();

  List<Post> get list {
    return _list;
  }

  PostProvider() {
    _init();
  }

  _init() async {
    _list = await postReository.getAllPost();
    notifyListeners();
  }

  Future addPost(Post post) async {
    postReository.addPost(post);
    _init();
    notifyListeners();
  }

  Future updatePost(Post post) async {
    postReository.updatePost(post);
    _init();
    notifyListeners();
  }
}
