import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/repositories/user_repository_impl.dart';

import '../data/dataSource/entiti/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _listUser = [];
  User _user = User();
  UserRepository userRepository = UserRepositoryImpl();

  List<User> get listUser {
    return _listUser;
  }

  User get user {
    return _user;
  }

  UserProvider() {
    _init();
  }
  _init() async {
    _listUser = await userRepository.getAllUser();
    notifyListeners();
  }

  Future getUser(String userName, String passwork) async {
    for (var user in _listUser) {
      if (user.username == userName && user.passwork == passwork) {
        _user = user;
      }
    }
    notifyListeners();
  }

  Future addUser(User user) async {
    _init();
    userRepository.addUser(user);
    notifyListeners();
  }

  Future updateUser(User user) async {
    userRepository.updateUser(user);
    _init();
  }

  User findUser(String id) {
    for (var user in listUser) {
      if (user.id == id) {
        return user;
      }
    }
    return User();
  }
}
