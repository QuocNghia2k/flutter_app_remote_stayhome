import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/post.dart';

class PostService {
  List<Post> listPost = [];
  late FirebaseFirestore db;

  PostService() {
    db = FirebaseFirestore.instance;
    _init();
  }
  _init() async {
    await getAllPost();
  }

  Future<List<Post>> getAllPost() async {
    await db.collection("posts").get().then((event) {
      for (var post in event.docs) {
        listPost.add(Post.fromJson(post.id, post.data()));
        print("${post.id} => ${post.data()}");
      }
    });
    return await listPost;
  }

  Future addPost(Post post) async {
    String id = "";
    db
        .collection("posts")
        .add(post.toMap())
        .then((DocumentReference doc) => id = doc.id);

    return id;
  }

  Future updatePost(Post post) async {
    try {
      await db.collection("posts").doc(post.id).update(post.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
