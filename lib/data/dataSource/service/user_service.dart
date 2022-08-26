import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';

class UserService {
  List<User> allUser = [];
  late FirebaseFirestore db;

  UserService() {
    db = FirebaseFirestore.instance;
    _init();
  }

  _init() async {
    await getAllUser();
  }

  Future<List<User>> getAllUser() async {
    List<User> listUser = [];
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        listUser.add(User.fromJson(doc.id, doc.data()));
      }
    });
    allUser.clear();
    allUser.addAll(listUser);
    return allUser;
  }

  Future<User> getUser(String id) async {
    for (User user in allUser) {
      if (user.id == id) {
        return user;
      }
    }
    return User();
  }

  Future<String> addUser(User user) async {
    String id = "";
    db
        .collection("users")
        .add(user.toMap())
        .then((DocumentReference doc) => id = doc.id);

    return id;
  }

  Future<bool> checkUserName(String userName) async {
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        if (userName == doc.data()["username"]) {
          return true;
        }
      }
    });
    return false;
  }

  Future updateUser(User user) async {
    try {
      await db.collection("users").doc(user.id).update(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> checkUser(String username, String passwork) async {
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        if (username == doc.data()["username"] &&
            passwork == doc.data()["passwork"]) {
          return doc.id;
        }
      }
    });
    return "";
  }
}
